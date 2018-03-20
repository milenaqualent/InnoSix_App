using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using InnosixWebApp.Models;
using Microsoft.AspNet.Identity;

namespace InnosixWebApp.Controllers
{
    public class TcEditNavbarController : Controller
    {
        // GET: TcEditNavbar
        [ChildActionOnly]
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();

            using (var db = new InnosixEntities())
            {
                var hasTc = db.AspNetUsersToTC.Any(x => x.AspNetUserId == userId);
                return PartialView("_EditTcNavbar", hasTc);
            }
        }
    }
}