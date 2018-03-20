using DevExpress.Web.Mvc;
using System;
using InnosixWebApp.Models;
using Microsoft.AspNet.Identity;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using InnosixWebApp.Helpers;
using Microsoft.AspNet.Identity.Owin;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "Admin,TC")]
    public class TechCompanyController : Controller
    {
        private readonly IEmailHelper _emailHelper;

        public TechCompanyController(IEmailHelper emailHelper)
        {
            _emailHelper = emailHelper;
        }

        public ActionResult Index()
        {
            var tcBasicInfo = GetTcWithChildren();

            if (tcBasicInfo != null)
                return View(tcBasicInfo);

            PopulateCountryDropDownList();
            return RedirectToAction("CreateTechCompany");
        }
        
        public ActionResult Edit()
        {
            var tCBasicInfo = GetTc();

            if (tCBasicInfo == null)
            {
                return HttpNotFound();
            }

            PopulateCountryDropDownList(tCBasicInfo.CountryId);

            return View(tCBasicInfo);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Address1,Address2,Address3,Zip,City,CountryId,CompanyEmail,CompanyName,CompanyPhone,LegalSuffix,CompanyWebsite,LogoUrl,RegistrationNumber")] TCBasicInfo tcBasicInfo)
        {
            if (!ModelState.IsValid)
                return View(tcBasicInfo);

            if (!Utilities.IsEmailValid(tcBasicInfo.CompanyEmail))
            {
                ViewBag.Message = "Invalid email address";
                PopulateCountryDropDownList(tcBasicInfo.CountryId);
                return View("Edit", tcBasicInfo);
            }

            if (!Utilities.ValidUrl(tcBasicInfo.CompanyWebsite))
            {
                ViewBag.Message = "Invalid website url";
                PopulateCountryDropDownList(tcBasicInfo.CountryId);
                return View("Edit", tcBasicInfo);
            }

            tcBasicInfo.CompanyWebsite = Utilities.CreateValidUrl(tcBasicInfo.CompanyWebsite);

            using (var db = new InnosixEntities())
            {
                db.TCGeneral.Find(tcBasicInfo.Id).LastUpdated = DateTime.Now;
                db.Entry(tcBasicInfo).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("Edit");
        }
        
        public ActionResult EditTechnology()
        {
            var tCBasicInfo = GetTcTechnology();

            if (tCBasicInfo == null)
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
                        ? new SelectListItem {Text = $"{tag.TagName}", Value = tag.Id.ToString()}
                        : new SelectListItem {Text = $"{tag.TagName} - {tag.Description}", Value = tag.Id.ToString()});
                }

                var tagIds = db.TechTagToTC.Where(t => t.TCid == tCBasicInfo.Id);
                tagList = db.TechTag.Where(t => tagIds.Any(ti => ti.TechTagId == t.Id)).ToList();

                techDomainList = db.TechDomain.ToList();
                var tdToTc = db.TechDomainToTC.Where(x => x.TCid == tCBasicInfo.Id);
                selectedTechDomains = db.TechDomain.Where(x => tdToTc.Any(y => y.TechDomainId == x.Id)).Select(x => x.Id).ToList();
            }

            ViewData["ParentTags"] = mainTagList;
            ViewData["Tags"] = tagList;
            ViewData["TechDomains"] = new MultiSelectList(techDomainList, "Id", "DomainName", selectedTechDomains);

            PopulateTechSectorDropDownList(tCBasicInfo.TCTechnology.TechnologySectorId);

            return View(tCBasicInfo.TCTechnology);
        }

        public JsonResult TagChildList(int id)
        {
            var tagList = new List<SelectListItem>();
            using (var db = new InnosixEntities())
            {
                var tagIds = db.TechTagParents.Where(ttp => ttp.ParentTechTagId == id);
                var tags = db.TechTag.Where(t => tagIds.Any(ti => ti.TechTagId == t.Id));
                foreach (var tag in tags)
                {
                    tagList.Add(string.IsNullOrWhiteSpace(tag.Description)
                        ? new SelectListItem { Text = $"{tag.TagName}", Value = tag.Id.ToString() }
                        : new SelectListItem { Text = $"{tag.TagName} - {tag.Description}", Value = tag.Id.ToString() });
                }
            }
            return Json(tagList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditTechnology([Bind(Include = "TCid,AdditionalTechTags,Patents,OtherIpNotPatented,TechnologySectorId")] TCTechnology tCTechnology, int[] tagIds, int[] techDomainIds)
        {
            if (!ModelState.IsValid)
                return View(tCTechnology);

            if (tagIds == null || tagIds.Length < 3)
            {
                ViewBag.Message = "Required minimum 3 tags";
                return EditTechnology();
            }
            
            if (techDomainIds == null || techDomainIds.Length == 0 || techDomainIds.Length > 3)
            {
                ViewBag.Message = "Required minimum 1 tech domain and maximum of 3";
                return EditTechnology();
            }

            if (!string.IsNullOrWhiteSpace(tCTechnology.AdditionalTechTags))
            {
                var additionalTagList = tCTechnology.AdditionalTechTags.Split(',').Select(t => t.Trim()).ToList();
                tCTechnology.AdditionalTechTags = string.Join(",", additionalTagList);
            }

            using (var db = new InnosixEntities())
            {
                var tcTagIds = db.TechTagToTC.Where(t => t.TCid == tCTechnology.TCid);
                db.TechTagToTC.RemoveRange(tcTagIds);
                foreach (var tagId in tagIds)
                {
                    db.TechTagToTC.Add(new TechTagToTC { TCid = tCTechnology.TCid, TechTagId = tagId});
                }
                
                var tcTechDomains = db.TechDomainToTC.Where(t => t.TCid == tCTechnology.TCid);
                db.TechDomainToTC.RemoveRange(tcTechDomains);
                foreach (var techDomainId in techDomainIds)
                {
                    db.TechDomainToTC.Add(new TechDomainToTC { TCid = tCTechnology.TCid, TechDomainId = techDomainId });
                }

                db.TCGeneral.Find(tCTechnology.TCid).LastUpdated = DateTime.Now;

                var tcTechnologyExists = db.TCTechnology.Any(x => x.TCid == tCTechnology.TCid);
                if (tcTechnologyExists)
                    db.Entry(tCTechnology).State = EntityState.Modified;
                else
                    db.TCTechnology.Add(tCTechnology);

                db.SaveChanges();
            }

            return RedirectToAction("EditTechnology");
        }
        
        public ActionResult CreateTechCompany()
        {
            if (HasTc(User.Identity.GetUserId()))
                return RedirectToAction("Index");

            var techCompany = new CreateTechCompanyViewModel
            {
                TagList = GetMainTagList(),
                TechDomainList = GetTechDomainList(),
                CountryList = GetCountryList()
            };

            return View(techCompany);
        }

        private bool HasTc(string id)
        {
            using (var db = new InnosixEntities())
            {
                return db.AspNetUsersToTC.Any(x => x.AspNetUserId == id);
            }
        }

        private IEnumerable<SelectListItem> GetMainTagList()
        {
            ICollection<SelectListItem> mainTagList = new List<SelectListItem>();
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
            }
            return mainTagList;
        }

        private IEnumerable<Country> GetCountryList()
        {
            using (var db = new InnosixEntities())
            {
                return db.Country.ToList();
            }
        }

        private IEnumerable<TechDomain> GetTechDomainList()
        {
            using (var db = new InnosixEntities())
            {
                return db.TechDomain.ToList();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateTechCompany(CreateTechCompanyViewModel techCompany)
        {
            if (!ModelState.IsValid)
                return View("CreateTechCompany", techCompany);

            if (!Utilities.IsEmailValid(techCompany.CompanyEmail))
            {
                ViewBag.Message = "Invalid email address";
                techCompany.TagList = GetMainTagList();
                techCompany.TechDomainList = GetTechDomainList();
                techCompany.CountryList = GetCountryList();
                return View("CreateTechCompany", techCompany);
            }
            
            if (!Utilities.ValidUrl(techCompany.CompanyWebsite))
            {
                ViewBag.Message = "Invalid website url";
                techCompany.TagList = GetMainTagList();
                techCompany.TechDomainList = GetTechDomainList();
                techCompany.CountryList = GetCountryList();
                return View("CreateTechCompany", techCompany);
            }

            techCompany.CompanyWebsite = Utilities.CreateValidUrl(techCompany.CompanyWebsite);
            
            if (techCompany.TagIds == null || techCompany.TagIds.Count() < 3)
            {
                ViewBag.Message = "Required minimum 3 tags";
                techCompany.TagList = GetMainTagList();
                techCompany.TechDomainList = GetTechDomainList();
                techCompany.CountryList = GetCountryList();
                return View("CreateTechCompany", techCompany);
            }

            if (techCompany.TechDomainIds == null || !techCompany.TechDomainIds.Any() || techCompany.TechDomainIds.Count() > 3)
            {
                ViewBag.Message = "Required minimum 1 tech domain and maximum of 3";
                techCompany.TagList = GetMainTagList();
                techCompany.TechDomainList = GetTechDomainList();
                techCompany.CountryList = GetCountryList();
                return View("CreateTechCompany", techCompany);
            }

            var existingTcId = TcExists(techCompany.CompanyWebsite);
            if (existingTcId != null)
                return RedirectToAction("ClaimForm", "TechCompany", new { id = existingTcId });

            var isTcCreated = CreateNewTcForUser(techCompany);
            if (!isTcCreated)
            {
                ViewBag.Message = "Couldn't create new tech company";
                techCompany.TagList = GetMainTagList();
                techCompany.TechDomainList = GetTechDomainList();
                techCompany.CountryList = GetCountryList();
                return View("CreateTechCompany", techCompany);
            }

            var model = GetTcWithChildren();
            return model != null ? View("Index", model) : View("CreateTechCompany", techCompany);
        }

        private long? TcExists(string companyWebsite)
        {
            using (var db = new InnosixEntities())
            {
                return db.TCBasicInfo.FirstOrDefault(x => x.CompanyWebsite == companyWebsite)?.Id;
            }
        }

        private long? GetUserTc()
        {
            using (var db = new InnosixEntities())
            {
                var userId = User.Identity.GetUserId();
                return db.AspNetUsersToTC
                    .FirstOrDefault(tc => tc.AspNetUserId == userId)?
                    .TCid;
            }
        }

        private TCBasicInfo GetTc()
        {
            using (var db = new InnosixEntities())
            {
                var tcId = GetUserTc();
                return tcId == null ? null : db.TCBasicInfo.Find(tcId);
            }
        }
        
        private TCBasicInfo GetTcTechnology()
        {
            using (var db = new InnosixEntities())
            {
                var tcId = GetUserTc();

                if (tcId == null)
                    return null;

                var tcBasicInfo = db.TCBasicInfo
                    .Include(x => x.TCTechnology)
                    .Include(x => x.TCTechnology.TechSector)
                    .Include(x => x.TechDomainToTC.Select(s => s.TechDomain))
                    .Include(x => x.TechTagToTC.Select(s => s.TechTag))
                    .First(t => t.Id == tcId);

                if (tcBasicInfo.TCTechnology == null)
                    tcBasicInfo.TCTechnology = new TCTechnology {TCid = (long) tcId};

                return tcBasicInfo;
            }
        }

        private TCBusinessInfo GetTcBusinessInfo()
        {
            using (var db = new InnosixEntities())
            {
                var tcId = GetUserTc();

                if (tcId == null)
                    return null;

                var tcBusinessInfo = db.TCBusinessInfo
                    .Include(x => x.Employees)
                    .Include(x => x.Maturity)
                    .Include(x => x.Nace)
                    .Include(x => x.Revenue)
                    .FirstOrDefault(t => t.TCid == tcId);

                return tcBusinessInfo ?? new TCBusinessInfo {TCid = (long)tcId};
            }
        }

        private TCIdealPartner GetTcIdealPartner()
        {
            using (var db = new InnosixEntities())
            {
                var tcId = GetUserTc();

                if (tcId == null)
                    return null;

                var tcIdealPartner = db.TCIdealPartner
                    .FirstOrDefault(t => t.TCid == tcId);

                return tcIdealPartner ?? new TCIdealPartner { TCid = (long)tcId };
            }
        }
        
        private TCContact GetTcContact()
        {
            using (var db = new InnosixEntities())
            {
                var tcId = GetUserTc();

                if (tcId == null)
                    return null;

                var tcContact = db.TCContact
                    .FirstOrDefault(t => t.TCid == tcId);

                return tcContact ?? new TCContact { TCid = (long)tcId };
            }
        }


        private TCBasicInfo GetTcWithChildren()
        {
            TCBasicInfo tcBasicInfo;
            using (var db = new InnosixEntities())
            {
                var userId = User.Identity.GetUserId();
                var tcId = db.AspNetUsersToTC
                    .FirstOrDefault(tc => tc.AspNetUserId == userId)?
                    .TCid;

                if (tcId == null)
                    return null;

                tcBasicInfo = GetTcWithChildren((long)tcId);
            }
            return tcBasicInfo;
        }

        public TCBasicInfo GetTcWithChildren(long id)
        {
            TCBasicInfo tcBasicInfo;
            using (var db = new InnosixEntities())
            {

                tcBasicInfo = db.TCBasicInfo
                    .Include(x => x.Country)
                    .Include(x => x.TCBusinessInfo)
                    .Include(x => x.TCBusinessInfo.Maturity)
                    .Include(x => x.TCBusinessInfo.Employees)
                    .Include(x => x.TCBusinessInfo.Revenue)
                    .Include(x => x.TCBusinessInfo.Nace)
                    .Include(x => x.TCTechnology.TechSector)
                    .Include(x => x.BusinessModelToTC.Select(bm => bm.BusinessModel))
                    .Include(x => x.TechDomainToTC.Select(td => td.TechDomain))
                    .Include(x => x.TechTagToTC.Select(tt => tt.TechTag))
                    .Include(x => x.ServicesToTC.Select(s => s.Services))
                    .Include(x => x.ProductToTC.Select(p => p.Product))
                    .Include(x => x.TCContact)
                    .Include(x => x.TCGeneral)
                    .Include(x => x.TCRating)
                    .FirstOrDefault(t => t.Id == id);
            }
            return tcBasicInfo;
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

        private bool CreateNewTcForUser(CreateTechCompanyViewModel techCompany)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var tcBasicInfo = new TCBasicInfo
                    {
                        CompanyName = techCompany.CompanyName,
                        CompanyWebsite = techCompany.CompanyWebsite,
                        CountryId = techCompany.CountryId,
                        CompanyEmail = techCompany.CompanyEmail,
                        CompanyPhone = techCompany.CompanyPhone
                    };

                    tcBasicInfo.TCActive = new TCActive
                    {
                        TCid = tcBasicInfo.Id,
                        IsActive = true
                    };
                    tcBasicInfo.TCGeneral = new TCGeneral
                    {
                        TCid = tcBasicInfo.Id,
                        Created = DateTime.Now,
                        LastUpdated = DateTime.Now
                    };
                    db.TCBasicInfo.Add(tcBasicInfo);

                    var techTagsToTc = techCompany.TagIds.Select(tagId => new TechTagToTC
                    {
                        TechTagId = tagId,
                        TCid = tcBasicInfo.Id
                    }).ToList();
                    db.TechTagToTC.AddRange(techTagsToTc);

                    var techDomainsToTc = techCompany.TechDomainIds.Select(techDomainId => new TechDomainToTC
                    {
                        TechDomainId = techDomainId,
                        TCid = tcBasicInfo.Id
                    }).ToList();
                    db.TechDomainToTC.AddRange(techDomainsToTc);

                    var userToTc = new AspNetUsersToTC
                    {
                        AspNetUserId = User.Identity.GetUserId(),
                        TCid = tcBasicInfo.Id
                    };

                    db.AspNetUsersToTC.Add(userToTc);
                    db.SaveChanges();

                    transaction.Commit();

                    return true;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    return false;
                }
            }
        }

        public ActionResult EditProducts()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult ProductsGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var tcId = GetUserTc();
                if (tcId == null)
                    return PartialView("_ProductsGridViewPartial");

                var productIds = db.ProductToTC.Where(x => x.TCid == tcId);
                var model = db.Product.Where(x => productIds.Any(y => y.ProductId == x.Id));
                return PartialView("_ProductsGridViewPartial", model.ToList());
            }
        }
        
        [HttpPost, ValidateInput(false)]
        public ActionResult ProductsGridViewPartialAddNew(Product item)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                var model = db.Product;
                if (ModelState.IsValid)
                {
                    try
                    {
                        model.Add(item);
                        db.SaveChanges();

                        var productToTc = new ProductToTC
                        {
                            ProductId = item.Id,
                            TCid = (long)GetUserTc()
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
                return ProductsGridViewPartial();
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ProductsGridViewPartialUpdate(Product item)
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
                return ProductsGridViewPartial();
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ProductsGridViewPartialDelete(long id)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                var model = db.Product;

                if (id < 0)
                    return PartialView("_ProductsGridViewPartial", model.ToList());

                try
                {
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
                return ProductsGridViewPartial();
            }
        }

        public ActionResult EditBusinessInfo()
        {
            var tcBusinessInfo = GetTcBusinessInfo();
            
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

            return View(tcBusinessInfo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditBusinessInfo(TCBusinessInfo tcBusinessInfo)
        {
            if (!ModelState.IsValid)
                return View(tcBusinessInfo);

            using (var db = new InnosixEntities())
            {
                db.TCGeneral.Find(tcBusinessInfo.TCid).LastUpdated = DateTime.Now;
                
                var tcBusinessInfoExists = db.TCBusinessInfo.Any(x => x.TCid == tcBusinessInfo.TCid);
                if (tcBusinessInfoExists)
                    db.Entry(tcBusinessInfo).State = EntityState.Modified;
                else
                    db.TCBusinessInfo.Add(tcBusinessInfo);

                db.SaveChanges();
            }

            return RedirectToAction("EditBusinessInfo");
        }

        public ActionResult EditIdealPartner()
        {
            var tcIdealPartner = GetTcIdealPartner();

            if (tcIdealPartner == null)
            {
                return HttpNotFound();
            }

            using (var db = new InnosixEntities())
            {
                ViewBag.TechSector = db.TechSector.ToList();
                ViewBag.Nace = db.Nace.ToList();
            }

            return View(tcIdealPartner);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditIdealPartner(TCIdealPartner tcIdealPartner)
        {
            if (!ModelState.IsValid)
                return View(tcIdealPartner);

            using (var db = new InnosixEntities())
            {
                db.TCGeneral.Find(tcIdealPartner.TCid).LastUpdated = DateTime.Now;
                
                var tcIdealPartnerExists = db.TCIdealPartner.Any(x => x.TCid == tcIdealPartner.TCid);
                if (tcIdealPartnerExists)
                    db.Entry(tcIdealPartner).State = EntityState.Modified;
                else
                    db.TCIdealPartner.Add(tcIdealPartner);

                db.SaveChanges();
            }

            return RedirectToAction("EditIdealPartner");
        }

        public ActionResult EditContact()
        {
            var tcContact = GetTcContact();

            if (tcContact == null)
            {
                return HttpNotFound();
            }

            return View(tcContact);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditContact(TCContact tcContact)
        {
            if (!ModelState.IsValid)
                return View(tcContact);

            if (!Utilities.IsEmailValid(tcContact.ContactPersonEmail))
            {
                ViewBag.Message = "Invalid email address";
                return View("EditContact", tcContact);
            }


            using (var db = new InnosixEntities())
            {
                db.TCGeneral.Find(tcContact.TCid).LastUpdated = DateTime.Now;
                
                var tcContactExists = db.TCContact.Any(x => x.TCid == tcContact.TCid);
                if (tcContactExists)
                    db.Entry(tcContact).State = EntityState.Modified;
                else
                    db.TCContact.Add(tcContact);

                db.SaveChanges();
            }

            return RedirectToAction("EditContact");
        }

        public ActionResult ClaimTechCompany()
        {
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult ClaimTechCompany(long id)
        {
            var userId = User.Identity.GetUserId();

            using (var db = new InnosixEntities())
            {
                var claim = new AspNetUsersTcClaim
                {
                    TCid = id,
                    AspNetUserId = userId
                };
                var isInClaims = db.AspNetUsersTcClaim.Any(x => x.AspNetUserId == userId && x.TCid == id);
                if (isInClaims)
                    return View("ClaimTechCompany");

                db.AspNetUsersTcClaim.Add(claim);
                db.SaveChanges();
            }

            return RedirectToAction("ClaimTechCompany");
        }

        public ActionResult ClaimTcGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var model = db.VTcClaim.OrderBy(x => x.CompanyName);
                return PartialView("_ClaimTcGridViewPartial", model.ToList());
            }
        }

        public ActionResult ClaimForm(long id)
        {
            using (var db = new InnosixEntities())
            {
                var claimFormViewModel = new ClaimFormViewModel
                {
                    TcBasicInfo = db.TCBasicInfo.Find(id),
                    AspNetUsersTcClaim = new AspNetUsersTcClaim { TCid = id }
                };
                return View(claimFormViewModel);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ClaimForm(ClaimFormViewModel claimForm)
        {
            var userId = User.Identity.GetUserId();
            var userEmail = User.Identity.GetUserName();

            using (var db = new InnosixEntities())
            {
                var claim = claimForm.AspNetUsersTcClaim;
                claim.AspNetUserId = userId;

                var isActive = db.TCActive.First(x => x.TCid == claim.TCid).IsActive;

                var automaticClaims = Environment.GetEnvironmentVariable("SendGridAutomaticClaims");
                if (!isActive && automaticClaims == "true")
                {
                    var claimed = AutomaticClaimAccept(claim.AspNetUserId, claim.TCid);
                    if (claimed)
                        return RedirectToAction("Index");

                    ViewBag.Message = "Error accured when claiming tech company";
                    return View("ClaimForm", claimForm);
                }

                var isInClaims = db.AspNetUsersTcClaim.Any(x => x.AspNetUserId == userId && x.TCid == claim.TCid);
                if (isInClaims)
                {
                    ViewBag.Message = "Claim already sent for this company";
                    return View("ClaimForm", claimForm);
                }

                db.AspNetUsersTcClaim.Add(claim);
                db.SaveChanges();

                if (isActive)
                {
                    var tc = db.TCBasicInfo.Find(claim.TCid);

                    var plainTextContent = $@"Claim request.

User email: {userEmail}
User phone number: {claim.PhoneNumber}
Company name: {tc.CompanyName}
Company email: {tc.CompanyEmail}
Company website: {tc.CompanyWebsite}

Claim description: {claim.Description}";

                    var htmlContent = $@"Claim request.<br/>
<br/>
User email: {userEmail}<br/>
User phone number: {claim.PhoneNumber}<br/>
Company name: {tc.CompanyName}<br/>
Company email: {tc.CompanyEmail}<br/>
Company website: {tc.CompanyWebsite}<br/>
<br/>
Claim description: {claim.Description}";

                    var tcOwnerId = db.AspNetUsersToTC.First(x => x.TCid == claim.TCid).AspNetUserId;
                    var tcOwnerEmail = db.AspNetUsers.First(x => x.Id == tcOwnerId).Email;
                    var adminEmail = Environment.GetEnvironmentVariable("SendGridAdminEmail");

                    IEnumerable<string> emails = new List<string> {userEmail, tcOwnerEmail, adminEmail};
                    await _emailHelper.SendSingleEmailToMultipleRecipients(emails, $"Claim request for company: {tc.CompanyName}", plainTextContent, htmlContent);
                }
            }

            ViewBag.Message = "Claim sent";
            return View();
        }

        private bool AutomaticClaimAccept(string userId, long tcId)
        {
            using (var db = new InnosixEntities())
            {
                var exists = db.AspNetUsersToTC.Any(x => x.AspNetUserId == userId && x.TCid == tcId);
                if (exists)
                    return false;

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
                    return false;

                tc.TCActive.IsActive = true;

                db.SaveChanges();

                return true;
            }
        }
    }
}
