using DevExpress.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using InnosixWebApp.Models;
using Microsoft.AspNet.Identity;
using InnosixWebApp.Helpers;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "User")]
    public class PortfoliosController : Controller
    {
        private readonly ITechCompanyService _techCompanyService;

        public PortfoliosController(ITechCompanyService techCompanyService)
        {
            _techCompanyService = techCompanyService;
        }

        public ActionResult Index()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult PortfoliosGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var userId = User.Identity.GetUserId();
                var userPortfolioIds = db.AspNetUsersToPortfolio.Where(x => x.AspNetUserId == userId);
                var userPortfolios = db.Portfolio.Where(x => userPortfolioIds.Any(y => y.PortfolioId == x.Id));
                return PartialView("_PortfoliosGridViewPartial", userPortfolios.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult PortfoliosGridViewPartialAddNew(Portfolio item)
        {
            var userId = User.Identity.GetUserId();

            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        db.Portfolio.Add(item);
                        db.SaveChanges();

                        db.AspNetUsersToPortfolio.Add(
                            new AspNetUsersToPortfolio
                            {
                                AspNetUserId = userId,
                                PortfolioId = item.Id
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
                return PortfoliosGridViewPartial();
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult PortfoliosGridViewPartialUpdate(Portfolio item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.Portfolio;
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
                return PortfoliosGridViewPartial();
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult PortfoliosGridViewPartialDelete(long id)
        {
            var userId = User.Identity.GetUserId();

            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                var model = db.Portfolio;

                if (id < 0)
                    return PortfoliosGridViewPartial();

                try
                {
                    var userPortfolio =
                        db.AspNetUsersToPortfolio.Single(x => x.AspNetUserId == userId && x.PortfolioId == id);
                    db.AspNetUsersToPortfolio.Remove(userPortfolio);
                    db.SaveChanges();

                    var portfolioItemIds = db.PortfolioToPortfolioItem.Where(x => x.PortfolioId == id);
                    db.PortfolioToPortfolioItem.RemoveRange(portfolioItemIds);
                    db.SaveChanges();

                    var item = model.FirstOrDefault(it => it.Id == id);
                    if (item != null)
                        model.Remove(item);
                    db.SaveChanges();

                    var ptpi = db.PortfolioToPortfolioItem;
                    var orphanPortfolioItems = db.PortfolioItem.Where(p =>
                        !ptpi.Any(y => y.PortfolioItemId == p.Id));
                    db.PortfolioItem.RemoveRange(orphanPortfolioItems);
                    db.SaveChanges();

                    transaction.Commit();
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                    transaction.Rollback();
                }
                return PortfoliosGridViewPartial();
            }
        }

        public ActionResult PortfolioItems(long id)
        {
            using (var db = new InnosixEntities())
            {
                ViewBag.PortfolioName = db.Portfolio.Find(id).Name;
            }
            return View(id);
        }

        [ValidateInput(false)]
        public ActionResult PortfolioItemsGridViewPartial(long id)
        {
            using (var db = new InnosixEntities())
            {
                ViewData["PortfolioId"] = id;
                var portfolioItems = db.PortfolioToPortfolioItem.Where(x => x.PortfolioId == id);
                var model = db.PortfolioItem
                    .Where(x => portfolioItems.Any(p => p.PortfolioItemId == x.Id))
                    .Include(x => x.TCBasicInfo)
                    .Include(x => x.Stage);
                return PartialView("_PortfolioItemsGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult PortfolioItemsGridViewPartialDelete(long id, long portfolioId)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var model = db.PortfolioItem;

                    if (id < 0)
                        return PortfolioItemsGridViewPartial(portfolioId);

                    var itemInPortfolios = db.PortfolioToPortfolioItem
                        .Where(x => x.PortfolioItemId == id);
                    db.PortfolioToPortfolioItem.RemoveRange(itemInPortfolios);

                    var item = model.FirstOrDefault(it => it.Id == id);
                    if (item != null)
                        model.Remove(item);
                    db.SaveChanges();
                    
                    var portfolio = db.Portfolio.Find(portfolioId);
                    portfolio.NrOfTCs = portfolio.NrOfTCs - 1;
                    db.Entry(portfolio).State = EntityState.Modified;
                    db.SaveChanges();

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                    transaction.Rollback();
                }
                return PortfolioItemsGridViewPartial(portfolioId);
            }
        }

        public ActionResult EditPortfolioItem(long id, long tcId, long portfolioId)
        {
            using (var db = new InnosixEntities())
            {
                ViewData["PortfolioId"] = portfolioId;
                var tcBasicInfo = _techCompanyService.GetTcWithChildren(tcId);
                var portfolioItem = db.PortfolioItem.FirstOrDefault(p => p.Id == id);
                var viewModel = new PortfolioItemViewModel
                {
                    TcBasicInfo = tcBasicInfo,
                    PortfolioItem = portfolioItem,
                    Stages = GetStages()
                };
                return View(viewModel);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPortfolioItem([Bind(Include = "Id,TCid,StageId,NextMoveId,NextMoveDate,ResponsibleEmail,ResponsibleName,OpportunityDate,Comment")] PortfolioItem portfolioItem, long portfolioId)
        {
            if (!ModelState.IsValid)
                return EditPortfolioItem(portfolioItem.Id, portfolioItem.TCid, portfolioId);

            if (!Utilities.IsEmailValid(portfolioItem.ResponsibleEmail))
            {
                ViewBag.Message = "Invalid email address";
                return View("EditPortfolioItem", new PortfolioItemViewModel
                {
                    TcBasicInfo = _techCompanyService.GetTcWithChildren(portfolioItem.TCid),
                    PortfolioItem = portfolioItem,
                    Stages = GetStages()
                });
            }

            using (var db = new InnosixEntities())
            {
                db.Entry(portfolioItem).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("PortfolioItems", new {id = portfolioId});
        }

        private IEnumerable<SelectListItem> GetStages()
        {
            using (var db = new InnosixEntities())
            {
                var userId = User.Identity.GetUserId();
                var userStageIds = db.AspNetUsersToStage.Where(x => x.AspNetUserId == userId);
                var userStages = db.Stage.Where(x => userStageIds.Any(y => y.StageId == x.Id)).Select(x =>
                    new SelectListItem
                    {
                        Value = x.Id.ToString(),
                        Text = x.Name
                    }).ToList();
                return userStages;
            }
        }

        public ActionResult AddCompanyToPortfolio(long id)
        {
            using (var db = new InnosixEntities())
            {
                var tc = db.TCBasicInfo.Find(id);
                return View("AddCompanyToPortfolio", tc);
            }
        }

        [ValidateInput(false)]
        public ActionResult AddToPortfolioGridViewPartial(long id)
        {
            ViewData["TCid"] = id;
            using (var db = new InnosixEntities())
            {
                var userId = User.Identity.GetUserId();
                var userPortfolioIds = db.AspNetUsersToPortfolio.Where(x => x.AspNetUserId == userId);
                var userPortfolios = db.Portfolio.Where(x => userPortfolioIds.Any(y => y.PortfolioId == x.Id));
                return PartialView("_AddToPortfolioGridViewPartial", userPortfolios.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddToPortfolioGridViewPartialAddNew(Portfolio item, long id)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        var userId = User.Identity.GetUserId();
                        var model = db.Portfolio;

                        model.Add(item);
                        db.SaveChanges();

                        db.AspNetUsersToPortfolio.Add(
                            new AspNetUsersToPortfolio
                            {
                                AspNetUserId = userId,
                                PortfolioId = item.Id
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
                {
                    ViewData["EditError"] = "Please, correct all errors.";
                }

                return AddToPortfolioGridViewPartial(id);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddToPortfolio(long id, long portfolioId)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var newItem = new PortfolioItem
                    {
                        TCid = id,
                        OpportunityDate = DateTime.Now
                    };
                    db.PortfolioItem.Add(newItem);
                    db.SaveChanges();

                    var newItemToPortfolio = new PortfolioToPortfolioItem
                    {
                        PortfolioId = portfolioId,
                        PortfolioItemId = newItem.Id
                    };
                    db.PortfolioToPortfolioItem.Add(newItemToPortfolio);
                    db.SaveChanges();

                    ViewBag.Message = "Added company to portfolio";

                    var portfolio = db.Portfolio.Find(portfolioId);
                    portfolio.NrOfTCs = portfolio.NrOfTCs + 1;
                    db.Entry(portfolio).State = EntityState.Modified;
                    db.SaveChanges();

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }

                return AddCompanyToPortfolio(id);
            }
        }

        private PortfolioItem GetPortfolioItemWithChildren(long id)
        {
            using (var db = new InnosixEntities())
            {
                return db.PortfolioItem
                    .Include(i => i.Stage)
                    .Include(i => i.Stage1)
                    .FirstOrDefault(p => p.Id == id);
            }
        }

        public ActionResult CompanyReport(long id, long tcId)
        {
            var viewModel = CompanyReportViewModel(id, tcId);
            return View(viewModel);
        }

        private ReportViewModel CompanyReportViewModel(long id, long tcId)
        {
            var viewModel = new ReportViewModel
            {
                TcBasicInfo = _techCompanyService.GetTcWithChildren(tcId)
            };

            using (var db = new InnosixEntities())
            {
                viewModel.PortfolioItem = db.PortfolioItem.Find(id);
            }

            return viewModel;
        }

        public ActionResult SummaryReport(long id)
        {
            var viewModel = SummaryReportViewModel(id);
            return View(viewModel);
        }

        public List<ReportViewModel> SummaryReportViewModel(long id)
        {
            var viewModel = new List<ReportViewModel>();

            using (var db = new InnosixEntities())
            {
                var portfolioItemIds = db.PortfolioToPortfolioItem.Where(p => p.PortfolioId == id).Select(s => s.PortfolioItemId);

                foreach (var portfolioItemId in portfolioItemIds)
                {
                    var portfolioItem = GetPortfolioItemWithChildren(portfolioItemId);
                    var tcBasicInfo = _techCompanyService.GetTcWithChildren(portfolioItem.TCid);
                    viewModel.Add(
                        new ReportViewModel
                        {
                            TcBasicInfo = tcBasicInfo,
                            PortfolioItem = portfolioItem
                        });
                }
            }

            return viewModel;
        }

        public void SendCompanyReportAsHtml(long id, long tcId)
        {
            var model = CompanyReportViewModel(id, tcId);
            var view = RenderViewToString("CompanyReport", model);
            var byteView = Encoding.UTF8.GetBytes(view);
            var fileName = $"{model.TcBasicInfo.CompanyName}_{DateTime.Now:dd-MM-yyyy}.html".Replace(" ", "_");
            SendHtmlFile(byteView, fileName);
        }

        public void SendSummaryReportAsHtml(long id)
        {
            string portfolioName;
            using (var db = new InnosixEntities())
            {
                portfolioName = db.Portfolio.Find(id)?.Name;
            }
            portfolioName = string.IsNullOrWhiteSpace(portfolioName) ? "Portfolio" : portfolioName.Replace(" ", "_");

            var model = SummaryReportViewModel(id);
            var view = RenderViewToString("SummaryReport", model);
            var byteView = Encoding.UTF8.GetBytes(view);
            var fileName = $"{portfolioName}_{DateTime.Now:dd-MM-yyyy}.html".Replace(" ", "_");
            SendHtmlFile(byteView, fileName);
        }

        private void SendHtmlFile(byte[] byteView, string fileName)
        {
            try
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Content-Length", byteView.Length.ToString());
                Response.AppendHeader("content-disposition", "attachment; filename=" + fileName);
                Response.ContentType = "Application/html";
                Response.BinaryWrite(byteView);
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                // Nlog stacktrace
            }
        }

        public ActionResult PrintCompanyReport(long id, long tcId)
        {
            var viewModel = CompanyReportViewModel(id, tcId);
            viewModel.Print = true;
            return View("CompanyReport", viewModel);
        }

        public ActionResult PrintSummaryReport(long id)
        {
            var viewModel = SummaryReportViewModel(id);
            viewModel[0].Print = true;
            return View("SummaryReport", viewModel);
        }

        public string RenderViewToString(string viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }
    }
}