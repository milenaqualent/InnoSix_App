# How to prepare CSV file for importing.

## Intro
Here you find guidelines how to prepare CSV file for import. You can find example file in folder "%Project folder%/Doc".

## Columns
There should always be 114 columns in csv file.

## Headers
Headers must be in order. Here are all 114 headers which must be included in file:
- `pipedrive_org_id`	
- `company_name`	
- `legal_suffix`	
- `country`	
- `registration_no`.	
- `company_address_line_1`	
- `company_address_line_2`	
- `company_address_line_3_zip`	
- `company_address_line_4_city`	
- `company_address_line_5`	
- `company_address_line_6`	
- `company_address_line_7`	
- `company_phone`	
- `company_email`	
- `company_website`	
- `logo_url`	
- `company_summary_description`	
- `technology_sector`	
- `tech_domain1`	
- `tech_domain2`	
- `tech_domain3`	
- `tag1`	
- `tag2`	
- `tag3`	
- `tag4`	
- `tag5`	
- `tag6`	
- `tag7`	
- `tag8`	
- `tag9`	
- `tag10`	
- `additional_tags`	
- `year_of_incorporation`	
- `maturity_stage`	
- `revenue_interval`	
- `profit_making`	
- `year`	
- `ftes`	
- `year`	
- `key_partners`	
- `key_competitors`	
- `type`	
- `largest_owners`	
- `company_logo`	
- `company_role`	
- `pipedrive_people_id`	
- `key_contact_person`	
- `position_in_company`	
- `contact_person_phone`	
- `contact_person_email`	
- `customer_focus`	
- `visiting_address_if_different_from_company_visiting_address`	
- `company_primary_contact_for_innosix`	
- `account_administrator`	
- `nace_code_`	
- `user_selected_theme_tags_company_level`	
- `user_proposed_new_theme_tags_`	
- `old_ncil_segment_info`	
- `old_ncil_segment_info_2`	
- `free_text_overall_activity_description`	
- `productservice_name_1`	
- `description_1`	
- `product_image_url_1`	
- `productservice_name_2`	
- `description_2`	
- `product_image_url_2`	
- `productservice_name_3`	
- `description_3`	
- `product_image_url_3`	
- `other_ip_not_patented`	
- `name_of_r_d_activity`	
- `r_d_focus`	
- `free_text_description_of_r_d_focus_`	
- `technology_milestone_name`	
- `technology_milestone_description`	
- `technology_milestone_date`	
- `ideal_corporate_partner_name`	
- `ideal_corporate_partner_nace`	
- `ideal_corporate_partner_technology_focus`	
- `my_company_must_appear_in_searches_including_these_search_words`	
- `product_company_documents`	
- `r_d_activities`	
- `ideal_corporate_partner_name`	
- `ideal_corporate_partner_nace`	
- `ideal_corporate_partner_tech_focus`	
- `my_company_must_appear_in_searches_including_these_search_words`	
- `email_notification_preference`	
- `overall_rating`	
- `brl_score`	
- `trl_score`	
- `freetext_note_field`	
- `document_links`	
- `status_technology_companies`	
- `cluster_relation`	
- `invoice`	
- `service`	
- `next_upsell_objective`	
- `innosix_account_manager`	
- `source`	
- `concat_tags`	
- `rating_bml_fundamentals`	
- `rating_bml_financials`	
- `rating_bml_mgmt&exe`	
- `rating_bml_market`	
- `rating_tml_technology`	
- `rating_tml_ip`	
- `rating_tml_techrisk`	
- `rating_bml_total`	
- `rating_bml_total_ci`	
- `rating_tml_total`	
- `rating_tml_total_ci`	
- `overall_rating`	
- `overall_rating_ci`	
- `rating_date`

## Required data
Rquired fields:
- `country`
- `company_email`
- `company_name`
- `company_phone`
- `company_website`
- `company_summary_description`
- `maturity_stage`
- `year_of_incorporation`
- `contact_person_email`
- `key_contact_person`
- `contact_person_phone`
- `tag1`
- `tag2`
- `tag3`
- `tech_domain1`

## Encoding & formating
Recommended encoding of the file is `UTF-8`. For separation of data use semicolon: `;`. If semicolon `;` is present in the the field, you need to put text in double quotes `""` to interprete semicolon as part of it.

## Other
LibreOffice likes to leave last line empty. Delete last line in text editor.