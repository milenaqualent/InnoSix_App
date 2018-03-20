using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using InnosixWebApp.Models;

namespace InnosixWebApp.Helpers
{
    public class TechCompanyService : ITechCompanyService
    {
        public TCBasicInfo GetTc(long id)
        {
            using (var db = new InnosixEntities())
            {
                return db.TCBasicInfo.Find(id);
            }
        }

        public TCBasicInfo GetTcWithChildren(long id)
        {
            using (var db = new InnosixEntities())
            {
                return db.TCBasicInfo
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
        }

        public TCBusinessInfo GetTcBusinessInfo(long id)
        {
            using (var db = new InnosixEntities())
            {
                var tcBusinessInfo = db.TCBusinessInfo
                    .Include(x => x.Employees)
                    .Include(x => x.Maturity)
                    .Include(x => x.Nace)
                    .Include(x => x.Revenue)
                    .FirstOrDefault(t => t.TCid == id);

                return tcBusinessInfo ?? new TCBusinessInfo { TCid = id };
            }
        }

        public TCBasicInfo GetTcTechnology(long id)
        {
            using (var db = new InnosixEntities())
            {
                var tcBasicInfo = db.TCBasicInfo
                    .Include(x => x.TCTechnology)
                    .Include(x => x.TCTechnology.TechSector)
                    .Include(x => x.TechDomainToTC.Select(s => s.TechDomain))
                    .Include(x => x.TechTagToTC.Select(s => s.TechTag))
                    .First(t => t.Id == id);

                if (tcBasicInfo.TCTechnology == null)
                    tcBasicInfo.TCTechnology = new TCTechnology { TCid = id };

                return tcBasicInfo;
            }
        }

        public TCIdealPartner GetTcIdealPartner(long id)
        {
            using (var db = new InnosixEntities())
            {
                var tcIdealPartner = db.TCIdealPartner
                    .FirstOrDefault(t => t.TCid == id);

                return tcIdealPartner ?? new TCIdealPartner { TCid = id };
            }
        }

        public TCContact GetTcContact(long id)
        {
            using (var db = new InnosixEntities())
            {
                var tcContact = db.TCContact
                    .FirstOrDefault(t => t.TCid == id);

                return tcContact ?? new TCContact { TCid = id };
            }
        }

        public TCRating GetTcRating(long id)
        {
            using (var db = new InnosixEntities())
            {
                var tcRating = db.TCRating
                    .FirstOrDefault(t => t.TCid == id);

                return tcRating ?? new TCRating { TCid = id };
            }
        }

        public void UpdateTcBasicInfo(TCBasicInfo tcBasicInfo)
        {
            using (var db = new InnosixEntities())
            {
                db.TCGeneral.Find(tcBasicInfo.Id).LastUpdated = DateTime.Now;
                db.Entry(tcBasicInfo).State = EntityState.Modified;
                db.SaveChanges();
            }
        }

        public void UpdateTcBusinessInfo(TCBusinessInfo tcBusinessInfo)
        {
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
        }

        public void UpdateTcTechnology(TCTechnology tcTechnology, int[] tagIds, int[] techDomainIds)
        {
            using (var db = new InnosixEntities())
            {
                var tcTagIds = db.TechTagToTC.Where(t => t.TCid == tcTechnology.TCid);
                db.TechTagToTC.RemoveRange(tcTagIds);
                foreach (var tagId in tagIds)
                {
                    db.TechTagToTC.Add(new TechTagToTC { TCid = tcTechnology.TCid, TechTagId = tagId });
                }

                var tcTechDomains = db.TechDomainToTC.Where(t => t.TCid == tcTechnology.TCid);
                db.TechDomainToTC.RemoveRange(tcTechDomains);
                foreach (var techDomainId in techDomainIds)
                {
                    db.TechDomainToTC.Add(new TechDomainToTC { TCid = tcTechnology.TCid, TechDomainId = techDomainId });
                }

                db.TCGeneral.Find(tcTechnology.TCid).LastUpdated = DateTime.Now;

                var tcTechnologyExists = db.TCTechnology.Any(x => x.TCid == tcTechnology.TCid);
                if (tcTechnologyExists)
                    db.Entry(tcTechnology).State = EntityState.Modified;
                else
                    db.TCTechnology.Add(tcTechnology);

                db.SaveChanges();
            }
        }

        public void UpdateTcIdealPartner(TCIdealPartner tcIdealPartner)
        {
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
        }

        public void UpdateTcContact(TCContact tcContact)
        {
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
        }

        public void UpdateTcRating(TCRating tcRating)
        {
            using (var db = new InnosixEntities())
            {
                tcRating.RatingDate = DateTime.Now;
                db.Entry(tcRating).State = EntityState.Modified;
                db.SaveChanges();
            }
        }
    }
}