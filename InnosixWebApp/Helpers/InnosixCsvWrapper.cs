namespace InnosixWebApp.Helpers
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using FileHelpers;
    using Models;

    public class InnosixCsvWrapper : IInnosixCsvWrapper
    {
        public IEnumerable<TCBasicInfo> ReadCsv(string filePath)
        {
            var engine = new FileHelperEngine<TechCompanyCsv>();
            var csvData = engine.ReadFile(filePath);
            var result = CsvToModelMapper(csvData);
            return result;
        }

        public IEnumerable<TCBasicInfo> ReadCsv(Stream inputStream)
        {
            var engine = new FileHelperEngine<TechCompanyCsv>();
            TechCompanyCsv[] csvData;
            using (var streamReader = new StreamReader(inputStream))
            {
                csvData = engine.ReadStream(streamReader);
            }
            var result = CsvToModelMapper(csvData);

            return result;
        }

        private IEnumerable<TCBasicInfo> CsvToModelMapper(IEnumerable<TechCompanyCsv> csvData)
        {
            using (var db = new InnosixEntities())
            {
                var dataList = new List<TCBasicInfo>();

                var iter = 1;

                try
                {
                    foreach (var data in csvData.Skip(1))
                    {
                        iter += 1;

                        var tc = new TCBasicInfo();

                        // TCBasicInfo
                        tc.Address1 = data.company_address_line_1;
                        tc.Address2 = data.company_address_line_2;
                        tc.Address3 = data.company_address_line_5;
                        tc.City = data.company_address_line_4_city;
                        tc.CompanyEmail = data.company_email;
                        tc.CompanyName = data.company_name;
                        tc.CompanyPhone = data.company_phone;
                        tc.CompanyWebsite = data.company_website;
                        tc.CountryId = db.Country.FirstOrDefault(c => c.CountryName == data.country).Id;
                        tc.LegalSuffix = data.legal_suffix;
                        tc.LogoUrl = data.logo_url;
                        tc.RegistrationNumber = data.registration_no;
                        tc.Zip = data.company_address_line_3_zip;

                        // TCBusinessInfo
                        tc.TCBusinessInfo = new TCBusinessInfo();
                        tc.TCBusinessInfo.BusinessSummary = data.company_summary_description;
                        tc.TCBusinessInfo.CompanyDescription = data.free_text_overall_activity_description;
                        tc.TCBusinessInfo.FullTimeEmployeesId =
                            db.Employees.FirstOrDefault(e => e.EmployeeTypeName == data.ftes)?.Id;
                        tc.TCBusinessInfo.Established = string.IsNullOrWhiteSpace(data.year_of_incorporation)
                            ? 0
                            : int.Parse(data.year_of_incorporation);
                        tc.TCBusinessInfo.FTEyear = string.IsNullOrWhiteSpace(data.ftes_year)
                            ? 0
                            : int.Parse(data.ftes_year);
                        tc.TCBusinessInfo.KeyCompetitors = data.key_competitors;
                        tc.TCBusinessInfo.KeyPartners = data.key_partners;
                        tc.TCBusinessInfo.LargestOwners = data.largest_owners;
                        tc.TCBusinessInfo.MaturityStageId =
                            db.Maturity.FirstOrDefault(m => m.MaturityStageName == data.maturity_stage)?.Id;
                        tc.TCBusinessInfo.NaceCodeId = db.Nace.FirstOrDefault(n => n.NACEcode == data.nace_code_)?.Id;
                        tc.TCBusinessInfo.ProfitMaking = data.profit_making.ToUpper() == "Y" ? true : false;
                        tc.TCBusinessInfo.RevenueId =
                            db.Revenue.FirstOrDefault(r => r.RevenueName == data.revenue_interval)?.Id;
                        tc.TCBusinessInfo.RevenueYear = string.IsNullOrWhiteSpace(data.revenue_year)
                            ? 0
                            : int.Parse(data.revenue_year);

                        // TCAdmin
                        tc.TCAdmin = new TCAdmin();
                        tc.TCAdmin.ClusterRelationId =
                            db.Cluster.FirstOrDefault(c => c.ClusterName == data.cluster_relation)?.Id;
                        tc.TCAdmin.FreetextNoteField = data.freetext_note_field;
                        tc.TCAdmin.InnosixAccountManagerId =
                            db.AccountManager
                                .FirstOrDefault(am => am.AccountManagerName == data.innosix_account_manager)?
                                .Id;
                        tc.TCAdmin.Source = data.source;

                        // TCContact
                        tc.TCContact = new TCContact();
                        tc.TCContact.ContactPersonEmail = data.contact_person_email;
                        tc.TCContact.ContactPersonName = data.key_contact_person;
                        tc.TCContact.ContactPersonPhone = data.contact_person_phone;
                        tc.TCContact.Position = data.position_in_company;

                        // TCGeneral
                        tc.TCGeneral = new TCGeneral();
                        tc.TCGeneral.Created = DateTime.Now;
                        tc.TCGeneral.LastUpdated = DateTime.Now;

                        // TCIdealPartner
                        tc.TCIdealPartner = new TCIdealPartner();
                        tc.TCIdealPartner.IdealCorporatePartnerNace =
                            db.Nace.FirstOrDefault(n => n.NACEcode == data.ideal_corporate_partner_nace2)?.Id;
                        tc.TCIdealPartner.IdealCorporatePartnerName = data.ideal_corporate_partner_name2;

                        // TCRating
                        tc.TCRating = new TCRating();
                        tc.TCRating.BML = string.IsNullOrWhiteSpace(data.rating_bml_total)
                            ? 0
                            : decimal.Parse(data.rating_bml_total);
                        tc.TCRating.BMLConfidenceIndex = string.IsNullOrWhiteSpace(data.rating_bml_total_ci)
                            ? 0
                            : int.Parse(data.rating_bml_total_ci);
                        tc.TCRating.Financials = string.IsNullOrWhiteSpace(data.rating_bml_financials)
                            ? 0
                            : int.Parse(data.rating_bml_financials);
                        tc.TCRating.Fundamentals = string.IsNullOrWhiteSpace(data.rating_bml_fundamentals)
                            ? 0
                            : int.Parse(data.rating_bml_fundamentals);
                        tc.TCRating.IntellectualProperty = string.IsNullOrWhiteSpace(data.rating_tml_ip)
                            ? 0
                            : int.Parse(data.rating_tml_ip);
                        tc.TCRating.ManagementAndExecution = string.IsNullOrWhiteSpace(data.rating_bml_mgmtAndexe)
                            ? 0
                            : int.Parse(data.rating_bml_mgmtAndexe);
                        tc.TCRating.Market = string.IsNullOrWhiteSpace(data.rating_bml_market)
                            ? 0
                            : int.Parse(data.rating_bml_market);
                        tc.TCRating.OverallRating = string.IsNullOrWhiteSpace(data.overall_rating2)
                            ? 0
                            : int.Parse(data.overall_rating2);
                        tc.TCRating.OverallRatingConfidenceIndex = string.IsNullOrWhiteSpace(data.overall_rating_ci)
                            ? 0
                            : int.Parse(data.overall_rating_ci);
                        tc.TCRating.RatingDate = DateTime.Now;
                        tc.TCRating.Technology = string.IsNullOrWhiteSpace(data.rating_tml_technology)
                            ? 0
                            : int.Parse(data.rating_tml_technology);
                        tc.TCRating.TechnologyRisk = string.IsNullOrWhiteSpace(data.rating_tml_techrisk)
                            ? 0
                            : int.Parse(data.rating_tml_techrisk);
                        tc.TCRating.TML = string.IsNullOrWhiteSpace(data.rating_bml_total_ci)
                            ? 0
                            : int.Parse(data.rating_tml_total);
                        tc.TCRating.TMLConfidenceIndex = string.IsNullOrWhiteSpace(data.rating_tml_total_ci)
                            ? 0
                            : int.Parse(data.rating_tml_total_ci);

                        // TCTechnology
                        tc.TCTechnology = new TCTechnology();
                        tc.TCTechnology.AdditionalTechTags = data.additional_tags;
                        tc.TCTechnology.OtherIpNotPatented = data.other_ip_not_patented;
                        tc.TCTechnology.TechnologySectorId =
                            db.TechSector.FirstOrDefault(ts => ts.TechSectorName == data.technology_sector)?.Id;

                        //TCActive
                        tc.TCActive = new TCActive();
                        tc.TCActive.IsActive = false;

                        // BusinessModel
                        var businessModelId = GetBusinessModelId(data.customer_focus);
                        if (businessModelId != null)
                            tc.BusinessModelToTC.Add(new BusinessModelToTC {BusinessModelId = (int) businessModelId});

                        // Product
                        if (!string.IsNullOrWhiteSpace(data.productservice_name_1))
                        {
                            tc.ProductToTC.Add(
                                new ProductToTC
                                {
                                    Product = new Product
                                    {
                                        ProductName = data.productservice_name_1,
                                        ProductDescription = data.description_1,
                                        ProductImage = data.product_image_url_1
                                    }
                                });
                        }

                        if (!string.IsNullOrWhiteSpace(data.productservice_name_2))
                        {
                            tc.ProductToTC.Add(
                                new ProductToTC
                                {
                                    Product = new Product
                                    {
                                        ProductName = data.productservice_name_2,
                                        ProductDescription = data.description_2,
                                        ProductImage = data.product_image_url_2
                                    }
                                });
                        }

                        if (!string.IsNullOrWhiteSpace(data.productservice_name_3))
                        {
                            tc.ProductToTC.Add(
                                new ProductToTC
                                {
                                    Product = new Product
                                    {
                                        ProductName = data.productservice_name_3,
                                        ProductDescription = data.description_3,
                                        ProductImage = data.product_image_url_3
                                    }
                                });
                        }

                        // Services
                        var serviceId = GetServiceId(data.service);
                        if (serviceId != null)
                            tc.ServicesToTC.Add(new ServicesToTC {ServicesId = (int) serviceId});

                        // TechDomain
                        var techDomainId = GetTechDomainId(data.tech_domain1);
                        if (techDomainId != null)
                            tc.TechDomainToTC.Add(new TechDomainToTC {TechDomainId = (int) techDomainId});

                        techDomainId = GetTechDomainId(data.tech_domain2);
                        if (techDomainId != null)
                            tc.TechDomainToTC.Add(new TechDomainToTC {TechDomainId = (int) techDomainId});

                        techDomainId = GetTechDomainId(data.tech_domain3);
                        if (techDomainId != null)
                            tc.TechDomainToTC.Add(new TechDomainToTC {TechDomainId = (int) techDomainId});

                        // TechTag
                        var tagId = GetTechTagId(data.tag1);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag2);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag3);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag4);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag5);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag6);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag7);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag8);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag9);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        tagId = GetTechTagId(data.tag10);
                        if (tagId != null)
                            tc.TechTagToTC.Add(new TechTagToTC {TechTagId = (int) tagId});

                        dataList.Add(tc);
                    }
                }
                catch (Exception ex)
                {
                    ex.Data.Add("ErrorOnLine", iter);
                    throw ex;
                }

                return dataList;
            }
        }

        private int? GetBusinessModelId(string name)
        {
            using (var db = new InnosixEntities())
            {
                return db.BusinessModel
                    .FirstOrDefault(bm => bm.BusinessModelName == name)?
                    .Id;
            }
        }

        private int? GetServiceId(string name)
        {
            using (var db = new InnosixEntities())
            {
                return db.Services
                    .FirstOrDefault(bm => bm.ServicesName == name)?
                    .Id;
            }
        }

        private int? GetTechDomainId(string name)
        {
            using (var db = new InnosixEntities())
            {
                return db.TechDomain
                    .FirstOrDefault(bm => bm.DomainName == name)?
                    .Id;
            }
        }

        private int? GetTechTagId(string name)
        {
            using (var db = new InnosixEntities())
            {
                return db.TechTag
                    .FirstOrDefault(tt => tt.TagName == name)?
                    .Id;
            }
        }
    }
}