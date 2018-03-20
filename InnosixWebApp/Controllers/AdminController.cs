using DevExpress.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using InnosixWebApp.Helpers;
using InnosixWebApp.Models;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly IInnosixCsvWrapper _innosixCvsWrapper;
        private readonly ITechCompanyService _techCompanyService;

        public AdminController(IInnosixCsvWrapper innosixCvsWrapper, ITechCompanyService techCompanyService)
        {
            _innosixCvsWrapper = innosixCvsWrapper;
            _techCompanyService = techCompanyService;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UploadCsvFile(HttpPostedFileBase file)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    var data = _innosixCvsWrapper.ReadCsv(file.InputStream);

                    using (var db = new InnosixEntities())
                    {
                        db.TCBasicInfo.AddRange(data);
                        db.SaveChanges();
                    }

                    ViewBag.Message = "File uploaded";
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = $"Failed to upload file. | Error on line: {ex.Data["ErrorOnLine"]} | Exception: {ex}";
            }
            return View("Index");
        }

        [ValidateInput(false)]
        public ActionResult TCsGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.VTcWithTags.OrderBy(x => x.CompanyName);
                return PartialView("_TCsGridViewPartial", model.ToList());
            }
        }

        public ActionResult TechCompanies()
        {
            return View();
        }

        public ActionResult TechCompany(long id)
        {
            var tcBasicInfo = _techCompanyService.GetTcWithChildren(id);
            return View("~/Views/TechCompany/Index.cshtml", tcBasicInfo);
        }

        public ActionResult TcEdit(long id)
        {
            var tCBasicInfo = _techCompanyService.GetTc(id);

            if (tCBasicInfo == null)
            {
                return HttpNotFound();
            }

            PopulateCountryDropDownList(tCBasicInfo.CountryId);

            return View("~/Views/TechCompany/Edit.cshtml", tCBasicInfo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TcEdit(TCBasicInfo tcBasicInfo)
        {
            if (!ModelState.IsValid)
                return View("~/Views/TechCompany/Edit.cshtml", tcBasicInfo);

            if (!Utilities.IsEmailValid(tcBasicInfo.CompanyEmail))
            {
                ViewBag.Message = "Invalid email address";
                PopulateCountryDropDownList(tcBasicInfo.CountryId);
                return View("~/Views/TechCompany/Edit.cshtml", tcBasicInfo);
            }

            if (!Utilities.ValidUrl(tcBasicInfo.CompanyWebsite))
            {
                ViewBag.Message = "Invalid website url";
                PopulateCountryDropDownList(tcBasicInfo.CountryId);
                return View("~/Views/TechCompany/Edit.cshtml", tcBasicInfo);
            }

            tcBasicInfo.CompanyWebsite = Utilities.CreateValidUrl(tcBasicInfo.CompanyWebsite);

            _techCompanyService.UpdateTcBasicInfo(tcBasicInfo);

            return RedirectToAction("TcEdit");
        }

        public ActionResult TcEditBusinessInfo(long id)
        {
            var tcBusinessInfo = _techCompanyService.GetTcBusinessInfo(id);
            
            if (tcBusinessInfo == null)
            {
                return HttpNotFound();
            }

            using (var db = new InnosixEntities())
            {
                ViewBag.Nace = db.Nace.ToList();
                ViewBag.FullTimeEmployees = db.Employees.ToList();
                ViewBag.Maturity = db.Maturity.ToList();
                ViewBag.Revenue = db.Revenue.ToList();
            }

            return View("~/Views/TechCompany/EditBusinessInfo.cshtml", tcBusinessInfo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TcEditBusinessInfo(TCBusinessInfo tcBusinessInfo)
        {
            if (!ModelState.IsValid)
                return View("~/Views/TechCompany/EditBusinessInfo.cshtml", tcBusinessInfo);

            _techCompanyService.UpdateTcBusinessInfo(tcBusinessInfo);

            return RedirectToAction("TcEditBusinessInfo", tcBusinessInfo);
        }

        public ActionResult TcEditTechnology(long id)
        {
            var tcBasicInfo = _techCompanyService.GetTcTechnology(id);

            if (tcBasicInfo == null)
            {
                return HttpNotFound();
            }

            var mainTagList = new List<SelectListItem>();
            IEnumerable<TechDomain> techDomainList;
            IEnumerable<int> selectedTechDomains;
            IEnumerable<TechTag> tagList;
            using (var db = new InnosixEntities())
            {
                var parentTagIds = db.TechTagParents;
                var parentTags = db.TechTag.Where(t => parentTagIds.Any(ti => ti.ParentTechTagId == t.Id));
                foreach (var tag in parentTags)
                {
                    mainTagList.Add(string.IsNullOrWhiteSpace(tag.Description)
                        ? new SelectListItem { Text = $"{tag.TagName}", Value = tag.Id.ToString() }
                        : new SelectListItem { Text = $"{tag.TagName} - {tag.Description}", Value = tag.Id.ToString() });
                }

                var tagIds = db.TechTagToTC.Where(t => t.TCid == tcBasicInfo.Id);
                tagList = db.TechTag.Where(t => tagIds.Any(ti => ti.TechTagId == t.Id)).ToList();

                techDomainList = db.TechDomain.ToList();
                var tdToTc = db.TechDomainToTC.Where(x => x.TCid == tcBasicInfo.Id);
                selectedTechDomains = db.TechDomain.Where(x => tdToTc.Any(y => y.TechDomainId == x.Id)).Select(x => x.Id).ToList();
            }

            ViewData["ParentTags"] = mainTagList;
            ViewData["Tags"] = tagList;
            ViewData["TechDomains"] = new MultiSelectList(techDomainList, "Id", "DomainName", selectedTechDomains);

            PopulateTechSectorDropDownList(tcBasicInfo.TCTechnology.TechnologySectorId);

            return View("~/Views/TechCompany/EditTechnology.cshtml", tcBasicInfo.TCTechnology);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TcEditTechnology(TCTechnology tcTechnology, int[] tagIds, int[] techDomainIds)
        {
            if (!ModelState.IsValid)
                return View("~/Views/TechCompany/EditTechnology.cshtml", tcTechnology);

            if (tagIds == null || tagIds.Length < 3)
            {
                ViewBag.Message = "Required minimum 3 tags";
                return TcEditTechnology(tcTechnology.TCid);
            }

            if (techDomainIds == null || techDomainIds.Length == 0 || techDomainIds.Length > 3)
            {
                ViewBag.Message = "Required minimum 1 tech domain and maximum of 3";
                return TcEditTechnology(tcTechnology.TCid);
            }

            if (!string.IsNullOrWhiteSpace(tcTechnology.AdditionalTechTags))
            {
                var additionalTagList = tcTechnology.AdditionalTechTags.Split(',').Select(t => t.Trim()).ToList();
                tcTechnology.AdditionalTechTags = string.Join(",", additionalTagList);
            }

            _techCompanyService.UpdateTcTechnology(tcTechnology, tagIds, techDomainIds);

            return RedirectToAction("TcEditTechnology");
        }

        public ActionResult TcEditIdealPartner(long id)
        {
            var tcIdealPartner = _techCompanyService.GetTcIdealPartner(id);

            if (tcIdealPartner == null)
            {
                return HttpNotFound();
            }

            using (var db = new InnosixEntities())
            {
                ViewBag.TechSector = db.TechSector.ToList();
                ViewBag.Nace = db.Nace.ToList();
            }

            return View("~/Views/TechCompany/EditIdealPartner.cshtml", tcIdealPartner);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TcEditIdealPartner(TCIdealPartner tcIdealPartner)
        {
            if (!ModelState.IsValid)
                return View("~/Views/TechCompany/EditIdealPartner.cshtml", tcIdealPartner);

            _techCompanyService.UpdateTcIdealPartner(tcIdealPartner);

            return RedirectToAction("TcEditIdealPartner");
        }

        public ActionResult TcEditContact(long id)
        {
            var tcContact = _techCompanyService.GetTcContact(id);

            if (tcContact == null)
            {
                return HttpNotFound();
            }

            return View("~/Views/TechCompany/EditContact.cshtml", tcContact);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TcEditContact(TCContact tcContact)
        {
            if (!ModelState.IsValid)
                return View("~/Views/TechCompany/EditContact.cshtml", tcContact);

            if (!Utilities.IsEmailValid(tcContact.ContactPersonEmail))
            {
                ViewBag.Message = "Invalid email address";
                return View("~/Views/TechCompany/EditContact.cshtml", tcContact);
            }
            
            _techCompanyService.UpdateTcContact(tcContact);

            return RedirectToAction("TcEditContact");
        }
        
        public ActionResult TcEditRating(long id)
        {
            var tcRating = _techCompanyService.GetTcRating(id);
            
            if (tcRating == null)
            {
                return HttpNotFound();
            }

            return View("~/Views/TechCompany/EditRating.cshtml", tcRating);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TcEditRating(TCRating tcRating)
        {
            _techCompanyService.UpdateTcRating(tcRating);
            return RedirectToAction("TcEditRating");
        }

        public ActionResult TcEditProducts(long id)
        {
            return View("TcEditProducts");
        }

        [ValidateInput(false)]
        public ActionResult ProductsGridViewPartial(long id)
        {
            using (var db = new InnosixEntities())
            {
                var productIds = db.ProductToTC.Where(x => x.TCid == id);
                var model = db.Product.Where(x => productIds.Any(y => y.ProductId == x.Id));
                return PartialView("_ProductsGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ProductsGridViewPartialAddNew(Product item, long tcId)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        var model = db.Product;
                        model.Add(item);
                        db.SaveChanges();

                        var productToTc = new ProductToTC
                        {
                            ProductId = item.Id,
                            TCid = tcId
                        };
                        db.ProductToTC.Add(productToTc);
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
                return ProductsGridViewPartial(tcId);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ProductsGridViewPartialUpdate(Product item, long tcId)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Product;
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
                return ProductsGridViewPartial(tcId);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ProductsGridViewPartialDelete(long id, long tcId)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var model = db.Product;

                    if (id < 0)
                        return ProductsGridViewPartial(tcId);

                    var productToTc = db.ProductToTC.FirstOrDefault(x => x.ProductId == id);
                    if (productToTc != null)
                        db.ProductToTC.Remove(productToTc);
                    db.SaveChanges();

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
                return ProductsGridViewPartial(tcId);
            }
        }

        private void PopulateCountryDropDownList(object selectedCountry = null)
        {
            List<Country> countryQuery;
            using (var db = new InnosixEntities())
            {
                countryQuery = db.Country.ToList();
            }
            ViewBag.Country = new SelectList(countryQuery, "Id", "CountryName", selectedCountry);
        }

        private void PopulateTechSectorDropDownList(object selectedTechSector = null)
        {
            List<TechSector> techSectorQuery;
            using (var db = new InnosixEntities())
            {
                techSectorQuery = db.TechSector.ToList();
            }
            ViewBag.TechSector = new SelectList(techSectorQuery, "Id", "TechSectorName", selectedTechSector);
        }
    }
}