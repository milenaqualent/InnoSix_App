using System;
using System.Linq;
using System.Web.Mvc;
using InnosixWebApp.Models;
using Microsoft.AspNet.Identity;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "User")]
    public class StagesController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult StagesGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var userId = User.Identity.GetUserId();
                var userStageIds = db.AspNetUsersToStage.Where(x => x.AspNetUserId == userId);
                var userStages = db.Stage.Where(x => userStageIds.Any(y => y.StageId == x.Id));
                return PartialView("_StagesGridViewPartial", userStages.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult StagesGridViewPartialAddNew(Stage item)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        var userId = User.Identity.GetUserId();

                        var model = db.Stage;
                        model.Add(item);
                        db.SaveChanges();

                        db.AspNetUsersToStage.Add(
                            new AspNetUsersToStage
                            {
                                AspNetUserId = userId,
                                StageId = item.Id
                            });
                        db.SaveChanges();

                        transaction.Commit();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                        transaction.Rollback();
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return StagesGridViewPartial();
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult StagesGridViewPartialUpdate(Stage item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Stage;
                if (ModelState.IsValid)
                {
                    try
                    {
                        var modelItem = model.FirstOrDefault(it => it.Id == item.Id);
                        if (modelItem != null)
                        {
                            UpdateModel(modelItem);
                            db.SaveChanges();
                        }
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return StagesGridViewPartial();
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult StagesGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    if (id < 0)
                        return StagesGridViewPartial();

                    var userId = User.Identity.GetUserId();
                    var userToTc =
                        db.AspNetUsersToStage.First(x => x.AspNetUserId == userId && x.StageId == id);
                    db.AspNetUsersToStage.Remove(userToTc);
                    db.SaveChanges();

                    var model = db.Stage;
                    var item = model.FirstOrDefault(it => it.Id == id);
                    if (item != null)
                        model.Remove(item);
                    db.SaveChanges();

                    transaction.Commit();
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                    transaction.Rollback();
                }
                return StagesGridViewPartial();
            }
        }
    }
}