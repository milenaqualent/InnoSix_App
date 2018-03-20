using DevExpress.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using InnosixWebApp.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Collections;
using InnosixWebApp.Helpers;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class UserManagerController : Controller
    {
        private ApplicationUserManager _userManager;

        public UserManagerController()
        {
            
        }

        public UserManagerController(ApplicationUserManager userManager)
        {
            UserManager = userManager;
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET: UserManager
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CreateUser()
        {
            var roles = new List<AspNetRoles>();
            using (var db = new InnosixEntities())
            {
                roles.AddRange(db.AspNetRoles);
            }
            ViewData["Roles"] = new SelectList(roles, "Id", "Name");

            return View();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateUser(string email, string role)
        {
            if (!Utilities.IsEmailValid(email))
            {
                ViewBag.Message = "Invalid email address";
                return View("CreateUser", new { Email = email, Role = role });
            }

            var user = new ApplicationUser { UserName = email, Email = email };
            var password = Membership.GeneratePassword(12, 1);
            var checkUser = UserManager.Create(user, password);

            using (var db = new InnosixEntities())
            {
                if (!checkUser.Succeeded)
                    return View();

                var roleName = db.AspNetRoles.Find(role)?.Name;

                if (roleName == null)
                {
                    return CreateUser();
                }
    
                UserManager.AddToRole(user.Id, roleName);
            }
            
            string code = UserManager.GenerateEmailConfirmationToken(user.Id);
            var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);

            UserManager.SendEmail(user.Id, "Innosix account", "Innosix account has been created.<br/><br/>" +
                                                              "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a><br/><br/>" +
                                                              $"Login: {user.Email}<br/>" +
                                                              $"Password: {password}<br/><br/>" +
                                                              "You can change the password in Manage Account tab.");

            return View("Index");
        }

        public ActionResult EditUser(string id)
        {
            AspNetUsers user;
            List<AspNetRoles> roles = new List<AspNetRoles>();
            using (var db = new InnosixEntities())
            {
                user = db.AspNetUsers.Find(id);
                roles.AddRange(db.AspNetRoles);
            }
            var userRole = UserManager.GetRoles(id).FirstOrDefault();
            ViewData["UserRole"] = roles.FirstOrDefault(x => x.Name == userRole);
            ViewData["Roles"] = new SelectList(roles, "Id", "Name", roles.First(x => x.Name == userRole).Id);
            return View(user);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditUser(AspNetUsers aspNetUsers, string role)
        {
            if (!ModelState.IsValid)
                return View(aspNetUsers);

            if (!Utilities.IsEmailValid(aspNetUsers.Email))
            {
                ViewBag.Message = "Invalid email address";
                return View("EditUser", aspNetUsers);
            }
            
            using (var db = new InnosixEntities())
            {
                var oldUserRoleId = UserManager.FindById(aspNetUsers.Id).Roles.SingleOrDefault()?.RoleId;

                if (role != oldUserRoleId)
                {
                    var oldUserRole = db.AspNetRoles.Single(x => x.Id == oldUserRoleId).Name;
                    UserManager.RemoveFromRole(aspNetUsers.Id, oldUserRole);
                    var newRole = db.AspNetRoles.Single(x => x.Id == role).Name;
                    UserManager.AddToRole(aspNetUsers.Id, newRole);
                }

                db.Entry(aspNetUsers).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("EditUser");
        }

        [ValidateInput(false)]
        public ActionResult UserGridViewPartial()
        {
            ICollection<UserViewModel> userList = new List<UserViewModel>();
            using (var db = new InnosixEntities())
            {
                var users = db.AspNetUsers.Include("AspNetRoles");

                foreach (var user in users)
                    userList.Add(new UserViewModel(user));
            }
            return PartialView("_UserGridViewPartial", userList);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult UserGridViewPartialDelete(string id)
        {
            var user = UserManager.FindById(id);

            RemoveUserTc(id);
            RemoveUserPortfolios(id);

            UserManager.Delete(user);

            return UserGridViewPartial();
        }

        private void RemoveUserTc(string id)
        {
            using (var db = new InnosixEntities())
            {
                var userToTc = db.AspNetUsersToTC
                    .FirstOrDefault(tc => tc.AspNetUserId == id);

                if (userToTc == null)
                    return;

                var tcBasicInfo = db.TCBasicInfo
                    .Include(x => x.TCActive)
                    .First(x => x.Id == userToTc.TCid);

                tcBasicInfo.TCActive.IsActive = false;

                db.Entry(tcBasicInfo).State = EntityState.Modified;
                db.AspNetUsersToTC.Remove(userToTc);
                db.SaveChanges();
            }
        }

        private void RemoveUserPortfolios(string id)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var userPortfolios =
                        db.AspNetUsersToPortfolio.Where(x => x.AspNetUserId == id);

                    if (!userPortfolios.Any())
                        return;

                    foreach (var portfolio in userPortfolios)
                    {
                        var portfolioItemIds = db.PortfolioToPortfolioItem.Where(x => x.PortfolioId == portfolio.Id);
                        db.PortfolioToPortfolioItem.RemoveRange(portfolioItemIds);
                        db.SaveChanges();

                        var item = db.Portfolio.FirstOrDefault(it => it.Id == portfolio.Id);
                        if (item != null)
                            db.Portfolio.Remove(item);
                        db.SaveChanges();

                        var ptpi = db.PortfolioToPortfolioItem;
                        var orphanPortfolioItems = db.PortfolioItem.Where(p =>
                            !ptpi.Any(y => y.PortfolioItemId == p.Id));
                        db.PortfolioItem.RemoveRange(orphanPortfolioItems);
                        db.SaveChanges();
                    }

                    db.AspNetUsersToPortfolio.RemoveRange(userPortfolios);
                    db.SaveChanges();

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
            }
        }
    }
}