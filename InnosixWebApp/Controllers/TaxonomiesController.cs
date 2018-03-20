using System;
using System.Linq;
using System.Web.Mvc;
using InnosixWebApp.Models;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class TaxonomiesController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TaxonomyCountry()
        {
            return View("Country");
        }

        [ValidateInput(false)]
        public ActionResult CountryGridView1Partial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Country;
                return PartialView("_CountryGridView1Partial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CountryGridView1PartialAddNew(Country item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Country;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_CountryGridView1Partial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CountryGridView1PartialUpdate(Country item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Country;
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
                return PartialView("_CountryGridView1Partial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CountryGridView1PartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Country;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_CountryGridView1Partial", model.ToList());
            }
        }

        public ActionResult TaxonomyBusinessModel()
        {
            return View("BusinessModel");
        }

        [ValidateInput(false)]
        public ActionResult BusinessModelGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.BusinessModel;
                return PartialView("_BusinessModelGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult BusinessModelGridViewPartialAddNew(BusinessModel item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.BusinessModel;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_BusinessModelGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult BusinessModelGridViewPartialUpdate(BusinessModel item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.BusinessModel;
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
                return PartialView("_BusinessModelGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult BusinessModelGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.BusinessModel;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_BusinessModelGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyCluster()
        {
            return View("Cluster");
        }

        [ValidateInput(false)]
        public ActionResult ClusterGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Cluster;
                return PartialView("_ClusterGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ClusterGridViewPartialAddNew(Cluster item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Cluster;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_ClusterGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ClusterGridViewPartialUpdate(Cluster item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Cluster;
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
                return PartialView("_ClusterGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ClusterGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Cluster;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_ClusterGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyEmployees()
        {
            return View("Employees");
        }

        [ValidateInput(false)]
        public ActionResult EmployeesGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Employees;
                return PartialView("_EmployeesGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EmployeesGridViewPartialAddNew(Employees item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Employees;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_EmployeesGridViewPartial", model.ToList());
            }
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult EmployeesGridViewPartialUpdate(Employees item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Employees;
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
                return PartialView("_EmployeesGridViewPartial", model.ToList());
            }
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult EmployeesGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Employees;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_EmployeesGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyMaturity()
        {
            return View("Maturity");
        }

        [ValidateInput(false)]
        public ActionResult MaturityGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Maturity;
                return PartialView("_MaturityGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult MaturityGridViewPartialAddNew(Maturity item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Maturity;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_MaturityGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult MaturityGridViewPartialUpdate(Maturity item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Maturity;
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
                return PartialView("_MaturityGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult MaturityGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Maturity;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_MaturityGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyNace()
        {
            return View("Nace");
        }

        [ValidateInput(false)]
        public ActionResult NaceGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Nace;
                return PartialView("_NaceGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult NaceGridViewPartialAddNew(Nace item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Nace;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_NaceGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult NaceGridViewPartialUpdate(Nace item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Nace;
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
                return PartialView("_NaceGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult NaceGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Nace;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_NaceGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyRevenue()
        {
            return View("Revenue");
        }

        [ValidateInput(false)]
        public ActionResult RevenueGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Revenue;
                return PartialView("_RevenueGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult RevenueGridViewPartialAddNew(Revenue item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Revenue;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_RevenueGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult RevenueGridViewPartialUpdate(Revenue item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Revenue;
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
                return PartialView("_RevenueGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult RevenueGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Revenue;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_RevenueGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyServices()
        {
            return View("Services");
        }

        [ValidateInput(false)]
        public ActionResult ServicesGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Services;
                return PartialView("_ServicesGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ServicesGridViewPartialAddNew(Services item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Services;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_ServicesGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ServicesGridViewPartialUpdate(Services item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Services;
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
                return PartialView("_ServicesGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ServicesGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Services;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_ServicesGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyTechDomain()
        {
            return View("TechDomain");
        }

        [ValidateInput(false)]
        public ActionResult TechDomainGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechDomain;
                return PartialView("_TechDomainGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TechDomainGridViewPartialAddNew(TechDomain item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechDomain;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_TechDomainGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TechDomainGridViewPartialUpdate(TechDomain item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechDomain;
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
                return PartialView("_TechDomainGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TechDomainGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechDomain;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_TechDomainGridViewPartial", model.ToList());
            }
        }

        public ActionResult TaxonomyTechSector()
        {
            return View("TechSector");
        }

        [ValidateInput(false)]
        public ActionResult TechSectorGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechSector;
                return PartialView("_TechSectorGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TechSectorGridViewPartialAddNew(TechSector item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechSector;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";
                return PartialView("_TechSectorGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TechSectorGridViewPartialUpdate(TechSector item)
        {
            using (var db = new InnosixEntities())
            {

                var model = db.TechSector;
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
                return PartialView("_TechSectorGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TechSectorGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {

                var model = db.TechSector;
                if (id >= 0)
                {
                    try
                    {
                        var item = model.FirstOrDefault(it => it.Id == id);
                        if (item != null)
                            model.Remove(item);
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        ViewData["EditError"] = e.Message;
                    }
                }
                return PartialView("_TechSectorGridViewPartial", model.ToList());
            }
        }
    }
}