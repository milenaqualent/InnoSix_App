using FileHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InnosixWebApp.Models
{
    [DelimitedRecord(";")]
    public class TechCompanyCsv
    {
        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string pipedrive_org_id;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_name;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string legal_suffix;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string country;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string registration_no;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_3_zip;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_4_city;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_5;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_6;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_address_line_7;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_phone;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_email;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_website;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string logo_url;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_summary_description;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string technology_sector;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tech_domain1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tech_domain2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tech_domain3;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag3;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag4;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag5;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag6;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag7;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag8;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag9;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string tag10;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string additional_tags;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string year_of_incorporation;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string maturity_stage;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string revenue_interval;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string profit_making;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string revenue_year;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ftes;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ftes_year;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string key_partners;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string key_competitors;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string type;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string largest_owners;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_logo;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_role;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string pipedrive_people_id;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string key_contact_person;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string position_in_company;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string contact_person_phone;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string contact_person_email;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string customer_focus;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string visiting_address_if_different_from_company_visiting_address;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string company_primary_contact_for_innosix;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string account_administrator;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string nace_code_;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string user_selected_theme_tags_company_level;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string user_proposed_new_theme_tags_;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string old_ncil_segment_info;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string old_ncil_segment_info_2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string free_text_overall_activity_description;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string productservice_name_1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string description_1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string product_image_url_1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string productservice_name_2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string description_2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string product_image_url_2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string productservice_name_3;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string description_3;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string product_image_url_3;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string other_ip_not_patented;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string name_of_r_d_activity;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string r_d_focus;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string free_text_description_of_r_d_focus_;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string technology_milestone_name;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string technology_milestone_description;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string technology_milestone_date;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ideal_corporate_partner_name1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ideal_corporate_partner_nace1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ideal_corporate_partner_technology_focus;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string my_company_must_appear_in_searches_including_these_search_words1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string product_company_documents;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string r_d_activities;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ideal_corporate_partner_name2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ideal_corporate_partner_nace2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string ideal_corporate_partner_tech_focus;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string my_company_must_appear_in_searches_including_these_search_words2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string email_notification_preference;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string overall_rating1;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string brl_score;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string trl_score;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string freetext_note_field;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string document_links;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string status_technology_companies;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string cluster_relation;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string invoice;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string service;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string next_upsell_objective;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string innosix_account_manager;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string source;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string concat_tags;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_bml_fundamentals;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_bml_financials;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_bml_mgmtAndexe;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_bml_market;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_tml_technology;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_tml_ip;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_tml_techrisk;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_bml_total;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_bml_total_ci;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_tml_total;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_tml_total_ci;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string overall_rating2;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string overall_rating_ci;

        [FieldQuoted('"', QuoteMode.OptionalForBoth)]
        public string rating_date;
    }
}