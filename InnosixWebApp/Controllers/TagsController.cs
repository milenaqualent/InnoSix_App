using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using InnosixWebApp.Models;

namespace InnosixWebApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class TagsController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet, ValidateInput(false)]
        public ActionResult EditTag(int id)
        {
            using (var db = new InnosixEntities())
            {
                var tag = db.TechTag.Find(id);
                return tag == null ? View("Index") : View(tag);
            }
        }

        public ActionResult AdditionalTags()
        {
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CreateTag(string tagName)
        {
            using (var db = new InnosixEntities())
            {
                var tags = db.TechTag;
                if (ModelState.IsValid)
                {
                    try
                    {
                        var tag = new TechTag
                        {
                            TagName = tagName
                        };

                        if (tags.Any(t => t.TagName == tagName))
                        {
                            ViewBag.Message = $"Tag with name {tagName} already exists";
                            return View("Index");
                        }

                        tags.Add(tag);
                        db.SaveChanges();

                        ViewBag.Message = $"Tag with name {tagName} created succesfully";
                    }
                    catch (Exception ex)
                    {
                        ViewData["EditError"] = ex.Message;
                    }
                }
                else
                    ViewData["EditError"] = "Please, correct all errors.";

                return View("Index");
            }
        }

        public ActionResult UpdateTag(TechTag tag)
        {
            if (!ModelState.IsValid)
                return View("Index");

            using (var db = new InnosixEntities())
            {
                db.Entry(tag).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult UnlinkTag(int id)
        {
            using (var db = new InnosixEntities())
            {
                var tags = db.TechTag;
                var tagParents = db.TechTagParents;

                if (id <= 0)
                    return PartialView("_TagsGridViewPartial", tags.ToList());

                try
                {
                    var tagParentsItems = tagParents.Where(tp => tp.TechTagId == id || tp.ParentTechTagId == id);
                    if (tagParentsItems.Any())
                        tagParents.RemoveRange(tagParentsItems);

                    db.SaveChanges();

                    var hasUpdatedRelations = UpdateRelationsCount(id);
                    if (!hasUpdatedRelations)
                        throw new ArgumentNullException();
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                }

                var tag = db.TechTag.Find(id);
                return View("EditTag", tag);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AcceptAdditionalTag(string tagName)
        {
            using (var db = new InnosixEntities())
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var tags = db.TechTag;

                    if (tags.Any(t => t.TagName == tagName))
                    {
                        ViewBag.Message = $"Tag with name: {tagName}, already exists";
                        return View("AdditionalTags");
                    }

                    var newTag = new TechTag
                    {
                        TagName = tagName
                    };

                    db.TechTag.Add(newTag);
                    db.SaveChanges();

                    var tcsWithAddTag = db.TCBasicInfo.Include(t => t.TCTechnology)
                        .Where(t => t.TCTechnology.AdditionalTechTags.Contains(tagName))
                        .ToList();

                    foreach (var tc in tcsWithAddTag)
                    {
                        var tagList = tc.TCTechnology.AdditionalTechTags.Split(',').Select(t => t.Trim()).ToList();
                        tagList.Remove(tagName);
                        tc.TCTechnology.AdditionalTechTags = string.Join(",", tagList);

                        db.Entry(tc).State = EntityState.Modified;
                        var newTagId = db.TechTag.First(t => t.TagName == tagName).Id;
                        tc.TechTagToTC.Add(new TechTagToTC { TechTagId = newTagId });
                        db.SaveChanges();
                    }

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                    transaction.Rollback();
                }

                ViewBag.Message = $"Tag with name: {tagName}, added";
                return View("AdditionalTags");
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult DeclineAdditionalTag(string tagName)
        {
            using (var db = new InnosixEntities())
            {
                try
                {
                    db.TechTagDeclined.Add(new TechTagDeclined { TagName = tagName });
                    db.SaveChanges();

                    ViewBag.Message = $"Tag with name: {tagName}, declined";
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                }
                return View("AdditionalTags");
            }
        }

        [ValidateInput(false)]
        public ActionResult TagsGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var tags = db.TechTag
                    .Include(x => x.TechTagToTC)
                    .Include(x => x.TechTagParents);
                var model = tags.Select(x =>
                    new {x.Id, x.ChildrenCount, x.ParentsCount, x.UsageCount, x.Description, x.TagName,
                        HasRelations = x.TechTagToTC.Any(y => x.Id == y.TechTagId) || x.TechTagParents.Any(y => x.Id == y.TechTagId || x.Id == y.ParentTechTagId)
                    });
                return PartialView("_TagsGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult TagsGridViewPartialAddNew(TechTag item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return TagsGridViewPartial();
            }
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult TagsGridViewPartialUpdate(TechTag item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return TagsGridViewPartial();
            }
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult TagsGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var tags = db.TechTag;
                var tagParents = db.TechTagParents;

                if (id <= 0)
                    return TagsGridViewPartial();

                try
                {
                    var tagAssignedToTc = db.TechTagToTC.Any(t => t.TechTagId == id);
                    if (tagAssignedToTc)
                        return TagsGridViewPartial();

                    var tagParentsItems = tagParents.Where(tp => tp.TechTagId == id || tp.ParentTechTagId == id);
                    if (tagParentsItems.Any())
                        return TagsGridViewPartial();

                    var tagItem = tags.FirstOrDefault(it => it.Id == id);
                    if (tagItem != null)
                        tags.Remove(tagItem);

                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                }
                return TagsGridViewPartial();
            }
        }

        [ValidateInput(false)]
        public ActionResult EditTagRelateGridViewPartial(int id)
        {
            using (var db = new InnosixEntities())
            {
                ViewData["id"] = id;
                var parents = db.TechTagParents.Where(tp => tp.TechTagId == id);
                var children = db.TechTagParents.Where(tp => tp.ParentTechTagId == id);
                var model = db.TechTag.Where(t =>
                    !parents.Any(p => p.ParentTechTagId == t.Id) &&
                    !children.Any(p => p.TechTagId == t.Id) &&
                    t.Id != id);
                return PartialView("_EditTagRelateGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagRelateGridViewPartialRelateParent(int id, int parentTagId)
        {
            using (var db = new InnosixEntities())
            {
                var tagHasRelation = db.TechTagParents.Where(t =>
                    t.TechTagId == id && t.ParentTechTagId == parentTagId);

                if (tagHasRelation.Any())
                    return View("Index");

                try
                {
                    var tagRelation = new TechTagParents()
                    {
                        TechTagId = id,
                        ParentTechTagId = parentTagId
                    };

                    db.TechTagParents.Add(tagRelation);
                    db.SaveChanges();

                    var updatedTag = UpdateRelationsCount(id);
                    var updatedParentTag = UpdateRelationsCount(parentTagId);
                    
                    if (!updatedTag || !updatedParentTag)
                        throw new ArgumentNullException();
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                }

                var tag = db.TechTag.Find(id);
                return tag == null ? View("Index") : View("EditTag", tag);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagRelateGridViewPartialRelateChild(int id, int childTagId)
        {
            using (var db = new InnosixEntities())
            {
                var tagHasRelation = db.TechTagParents.Where(t =>
                    t.TechTagId == childTagId && t.ParentTechTagId == id);

                if (tagHasRelation.Any())
                    return View("Index");

                try
                {
                    var tagRelation = new TechTagParents()
                    {
                        TechTagId = childTagId,
                        ParentTechTagId = id
                    };

                    db.TechTagParents.Add(tagRelation);
                    db.SaveChanges();

                    var updatedTag = UpdateRelationsCount(id);
                    var updatedChildTag = UpdateRelationsCount(childTagId);

                    if (!updatedTag || !updatedChildTag)
                        throw new ArgumentNullException();
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                }

                var tag = db.TechTag.Find(id);
                return tag == null ? View("Index") : View("EditTag", tag);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagRelateGridViewPartialAddNew(TechTag item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return PartialView("_EditTagRelateGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagRelateGridViewPartialUpdate(TechTag item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return PartialView("_EditTagRelateGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagRelateGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return PartialView("_EditTagRelateGridViewPartial", model.ToList());
            }
        }

        [ValidateInput(false)]
        public ActionResult EditTagUnlinkGridViewPartial(int id)
        {
            using (var db = new InnosixEntities())
            {
                ViewData["id"] = id;
                var parents = db.TechTagParents.Where(tp => tp.TechTagId == id);
                var children = db.TechTagParents.Where(tp => tp.ParentTechTagId == id);
                var model = db.TechTag.Where(t =>
                    (parents.Any(p => p.ParentTechTagId == t.Id) ||
                     children.Any(p => p.TechTagId == t.Id)) &&
                    t.Id != id);
                return PartialView("_EditTagUnlinkGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagUnlinkGridViewPartialUnlink(int id, int unlinkTagId)
        {
            using (var db = new InnosixEntities())
            {
                var tagRelations = db.TechTagParents.Where(t =>
                    (t.TechTagId == id && t.ParentTechTagId == unlinkTagId) ||
                    (t.TechTagId == unlinkTagId && t.ParentTechTagId == id));

                try
                {
                    if (tagRelations.Any())
                    {
                        db.TechTagParents.RemoveRange(tagRelations);
                        db.SaveChanges();

                        var updatedTag = UpdateRelationsCount(id);
                        var updatedUnlinkTag = UpdateRelationsCount(unlinkTagId);

                        if (!updatedTag || !updatedUnlinkTag)
                            throw new ArgumentNullException();
                    }
                }
                catch (Exception ex)
                {
                    ViewData["EditError"] = ex.Message;
                }

                var tag = db.TechTag.Find(id);
                return tag == null ? View("Index") : View("EditTag", tag);
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagUnlinkGridViewPartialAddNew(TechTag item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return PartialView("_EditTagUnlinkGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagUnlinkGridViewPartialUpdate(TechTag item)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return PartialView("_EditTagUnlinkGridViewPartial", model.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditTagUnlinkGridViewPartialDelete(int id)
        {
            using (var db = new InnosixEntities())
            {
                var model = db.TechTag;
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
                return PartialView("_EditTagUnlinkGridViewPartial", model.ToList());
            }
        }

        [ValidateInput(false)]
        public ActionResult AdditionalTagsGridViewPartial()
        {
            using (var db = new InnosixEntities())
            {
                var tags = db.TechTag;
                var tagsDeclined = db.TechTagDeclined;
                var additionalTags = db.GetAdditionalTechTags()
                    .Where(at =>
                    !tags.Any(t => t.TagName == at.AdditionalTechTags) &&
                    !tagsDeclined.Any(t => t.TagName == at.AdditionalTechTags));
                return PartialView("_AdditionalTagsGridViewPartial", additionalTags.ToList());
            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AdditionalTagsGridViewPartialAddNew(GetAdditionalTechTags_Result item)
        {
            var model = new object[0];
            if (ModelState.IsValid)
            {
                try
                {
                    // Insert here a code to insert the new item in your model
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            return PartialView("_AdditionalTagsGridViewPartial", model);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AdditionalTagsGridViewPartialUpdate(GetAdditionalTechTags_Result item)
        {
            var model = new object[0];
            if (ModelState.IsValid)
            {
                try
                {
                    // Insert here a code to update the item in your model
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            return PartialView("_AdditionalTagsGridViewPartial", model);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AdditionalTagsGridViewPartialDelete(long TCid)
        {
            var model = new object[0];
            if (TCid >= 0)
            {
                try
                {
                    // Insert here a code to delete the item from your model
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            return PartialView("_AdditionalTagsGridViewPartial", model);
        }

        private bool UpdateRelationsCount(int id)
        {
            using (var db = new InnosixEntities())
            {
                var parentsCount = db.TechTagParents.Count(t => t.TechTagId == id);
                var childrenCount = db.TechTagParents.Count(t => t.ParentTechTagId == id);

                var tag = db.TechTag.Find(id);
                if (tag == null)
                    return false;

                tag.ParentsCount = parentsCount;
                tag.ChildrenCount = childrenCount;
                db.SaveChanges();

                return true;
            }
        }

        public static bool HasTagRelations(int id)
        {
            if (id <= 0)
                throw new ArgumentOutOfRangeException();

            using (var db = new InnosixEntities())
            {
                var connectedToTc = db.TechTagToTC.Any(t => t.TechTagId == id);
                var hasRelations = db.TechTagParents
                    .Any(tp => tp.TechTagId == id || tp.ParentTechTagId == id);
                return connectedToTc || hasRelations;
            }
        }
    }
}