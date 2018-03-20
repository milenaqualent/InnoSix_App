namespace InnosixWebApp.Controllers
{
    using System.Web.Mvc;

    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (User.IsInRole("Admin"))
                return RedirectToAction("Index", "Admin");

            if (User.IsInRole("TC"))
                return RedirectToAction("Index", "TechCompany");
            
            if (User.IsInRole("User"))
                return RedirectToAction("Index", "User");

            return RedirectToAction("Login", "Account");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}