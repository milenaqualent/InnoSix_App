using DevExpress.Web.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DevExpress.DashboardCommon.Native;
using InnosixWebApp.Helpers;
using InnosixWebApp.Models;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "User")]
    public class UserController : Controller
    {
        private readonly ITechCompanyService _techCompanyService;

        public UserController(ITechCompanyService techCompanyService)
        {
            _techCompanyService = techCompanyService;
        }

        public ActionResult Index()
        {
            return Index(null);
        }

        // GET: User
        [HttpPost, ValidateInput(false)]
        public ActionResult Index(int[] tagIds = null,
            bool includeParents = false,
            bool includeSiblings = false,
            int levelRange = 0,
            int[] countries = null,
            int[] techDomains = null,
            int[] maturityStages = null,
            int[] revenues = null,
            int[] employees = null,
            int[] businessModels = null)
        {
            ICollection<SelectListItem> mainTagList = new List<SelectListItem>();
            IEnumerable<TechTag> tagList = new List<TechTag>();
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
                
                if (tagIds != null)
                    tagList = db.TechTag.Where(t => tagIds.Any(ti => ti == t.Id)).ToList();

                ViewData["ParentTags"] = mainTagList;
                ViewData["Tags"] = tagList;

                var countryList = db.Country.ToList();
                ViewData["Countries"] = new MultiSelectList(countryList, "Id", "CountryName", countries);
                var techDomainList = db.TechDomain.ToList();
                ViewData["TechDomains"] = new MultiSelectList(techDomainList, "Id", "DomainName", techDomains);
                var maturityStageList = db.Maturity.ToList();
                ViewData["MaturityStages"] = new MultiSelectList(maturityStageList, "Id", "MaturityStageName", maturityStages);
                var revenueList = db.Revenue.ToList();
                ViewData["Revenues"] = new MultiSelectList(revenueList, "Id", "RevenueName", revenues);
                var employeeList = db.Employees.ToList();
                ViewData["Employees"] = new MultiSelectList(employeeList, "Id", "EmployeeTypeName", employees);
                var businessModelList = db.BusinessModel.ToList();
                ViewData["BusinessModels"] = new MultiSelectList(businessModelList, "Id", "BusinessModelName", businessModels);

                GetTcWithChildren(tagIds, includeParents, includeSiblings, levelRange,
                    countries, techDomains, maturityStages, revenues, employees, businessModels);
                
                return View(Session["TcList"]);
            }
        }
        
        private void GetTcWithChildren(int[] tagIds, bool includeParents, bool includeSiblings, int levelRange,
            int[] countries,
            int[] techDomains,
            int[] maturityStages,
            int[] revenues,
            int[] employees,
            int[] businessModels)
        {
            using (var db = new InnosixEntities())
            {
                var tcBasicInfo = db.TCBasicInfo
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
                    .Include(x => x.TCRating);

                if (countries != null)
                    tcBasicInfo = tcBasicInfo.Where(x => countries.Any(y => y == x.CountryId));

                if (techDomains != null)
                    tcBasicInfo = tcBasicInfo.Where(x => techDomains.Any(y => x.TechDomainToTC.Any(z => z.TechDomainId == y)));

                if (maturityStages != null)
                    tcBasicInfo = tcBasicInfo.Where(x => maturityStages.Any(y => y == x.TCBusinessInfo.MaturityStageId));

                if (revenues != null)
                    tcBasicInfo = tcBasicInfo.Where(x => revenues.Any(y => y == x.TCBusinessInfo.RevenueId));

                if (employees != null)
                    tcBasicInfo = tcBasicInfo.Where(x => employees.Any(y => y == x.TCBusinessInfo.FullTimeEmployeesId));

                if (businessModels != null)
                    tcBasicInfo = tcBasicInfo.Where(x => businessModels.Any(y => x.BusinessModelToTC.Any(z => z.BusinessModelId == y)));

                HashSet<int> tagList = null;

                if (tagIds != null)
                {
                    tagList = new HashSet<int>(tagIds);

                    if (includeParents)
                    {
                        var parentTags = GetParentTags(tagIds);
                        tagList.UnionWith(parentTags);
                    }

                    if (includeSiblings)
                    {
                        var siblingTags = GetSiblingTags(tagIds);
                        tagList.UnionWith(siblingTags);
                    }

                    if (levelRange > 0)
                    {
                        var tagsInLevelRange = GetTagsInLevelRenge(tagIds, levelRange);
                        tagList.UnionWith(tagsInLevelRange);
                    }
                }

                if (tagList != null)
                    tcBasicInfo = tcBasicInfo.Where(bi => bi.TechTagToTC.Any(ttt => tagList.Any(ti => ti == ttt.TechTagId)));

                Session["TcList"] = db.VTcWithTagsUser.Where(x => tcBasicInfo.Any(t => t.Id == x.Id)).OrderBy(x => x.CompanyName).ToList();
            }
        }

        private IEnumerable<int> GetParentTags(int[] tagIds)
        {
            var parentTagIds = new HashSet<int>();
            using (var db = new InnosixEntities())
            {
                var relationTable = db.GetTagHierarchy().ToList();
                var parents = relationTable.Where(x => tagIds.Any(y => y == x.TagId && x.Level > 0)).ToList();
                foreach (var parent in parents)
                {
                    var node = parent.Node.Split(new[] {'/'}, StringSplitOptions.RemoveEmptyEntries);
                    var parentId = int.Parse(node[node.Length - 2]);
                    parentTagIds.Add(parentId);
                }
            }
            return parentTagIds;
        }

        private IEnumerable<int> GetSiblingTags(int[] tagIds)
        {
            var parents = GetParentTags(tagIds);

            var siblingsTagIds = new HashSet<int>();
            using (var db = new InnosixEntities())
            {
                var relationTable = db.GetTagHierarchy().ToList();

                foreach (var parent in parents)
                {
                    var siblings = relationTable.Where(x => x.Node.Contains($"/{parent}/")).ToList();
                    foreach (var sibling in siblings)
                    {
                        var siblingId = GetSiblingIdFromNode(sibling.Node, parent);
                        siblingsTagIds.Add(siblingId);
                    }
                }
            }
            return siblingsTagIds;
        }

        private IEnumerable<int> GetTagsInLevelRenge(int[] tagIds, int levelRange)
        {
            var tagIdsInRange = new HashSet<int>();

            using (var db = new InnosixEntities())
            {
                var relationTable = db.GetTagHierarchy().ToList();

                foreach (var tagId in tagIds)
                {
                    var nodes = relationTable.Where(x => x.Node.Contains($"/{tagId}/") || (x.TagId == tagId && x.Level > 0));

                    foreach (var node in nodes)
                    {
                        var nodeTagIds = node.Node.Split(new[] {'/'}, StringSplitOptions.RemoveEmptyEntries);

                        var tagIndex = nodeTagIds.IndexOf(tagId.ToString());

                        var indexStart = tagIndex - levelRange;
                        indexStart = indexStart > 0 ? indexStart : 0;

                        var indexEnd = tagIndex + levelRange;
                        indexEnd = indexEnd < nodeTagIds.Length - 1 ? indexEnd : nodeTagIds.Length - 1;

                        for (var i = indexStart; i <= indexEnd; i++)
                            tagIdsInRange.Add(int.Parse(nodeTagIds[i]));
                    }
                }
            }
            return tagIdsInRange;
        }

        private int GetSiblingIdFromNode(string node, int id)
        {
            var siblingString = node.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            var index = siblingString.IndexOf(id.ToString());
            return int.Parse(siblingString[index + 1]);
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

        [ValidateInput(false)]
        public ActionResult TCsGridViewPartial()
        {
            return PartialView("_TcsGridViewPartial", Session["TcList"]);
        }
        
        public ActionResult PreviewTechCompany(long id)
        {
            var tcBasicInfo = _techCompanyService.GetTcWithChildren(id);
            return View("~/Views/TechCompany/Index.cshtml", tcBasicInfo);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Export()
        {
            var model = Session["TcList"];
            return GridViewExtension.ExportToCsv(GridViewHelper.ExportGridViewSettings, model, "Tech company search.csv");
        }
    }
    
    public static class GridViewHelper
    {
        private static GridViewSettings exportGridViewSettings;

        public static GridViewSettings ExportGridViewSettings
        {
            get
            {
                if (exportGridViewSettings == null)
                    exportGridViewSettings = CreateExportGridViewSettings();
                return exportGridViewSettings;
            }
        }

        private static GridViewSettings CreateExportGridViewSettings()
        {
            var settings = new GridViewSettings();

            settings.Name = "TCsGridView";
            settings.CallbackRouteValues = new { Controller = "User", Action = "TCsGridViewPartial" };

            settings.KeyFieldName = "Id";

            settings.Columns.Add("CompanyName");
            settings.Columns.Add("City");
            settings.Columns.Add("Country");
            settings.Columns.Add("CompanyEmail");
            settings.Columns.Add("LegalSuffix");
            settings.Columns.Add("CompanyWebsite");
            settings.Columns.Add("TechTags");

            return settings;
        }
    }
}