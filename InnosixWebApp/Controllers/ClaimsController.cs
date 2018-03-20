using System;
using System.Data.Entity.Core;
using System.Linq;
using DevExpress.Web.Mvc;
using System.Web.Mvc;
using InnosixWebApp.Models;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ClaimsController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult ClaimTcGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.VUserTcClaim.Where(x => !x.IsActive);
                return PartialView("_ClaimTcGridViewPartial", model.ToList());    
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AcceptClaim(int id, string userId, long tcId)
        {
            using (var db = new InnosixEntities())
            {
                db.AspNetUsersToTC.Add(
                    new AspNetUsersToTC
                    {
                        AspNetUserId = userId,
                        TCid = tcId
                    });

                var tc = db.TCBasicInfo
                    .Include("TCActive")
                    .FirstOrDefault(x => x.Id == tcId);
                if (tc == null)
                    return View("Index");

                tc.TCActive.IsActive = true;

                var claim = db.AspNetUsersTcClaim.Find(id);
                if (claim == null)
                    return View("Index");

                db.AspNetUsersTcClaim.Remove(claim);

                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult DeclineClaim(int id)
        {
            using (var db = new InnosixEntities())
            {
                var claim = db.AspNetUsersTcClaim.Find(id);
                if (claim == null)
                    return View("Index");

                db.AspNetUsersTcClaim.Remove(claim);
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }
    }
}