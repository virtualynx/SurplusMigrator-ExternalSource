DROP MATERIALIZED VIEW IF EXISTS mt_agen cascade;

CREATE materialized VIEW mt_agen as
	SELECT 
		agen_code,
		agen_com_name,
		agen_com_addr1,
		agen_com_addr2,
		agen_com_phone,
		agen_com_fax ,
		agen_com_email ,
		agen_com_web ,
		agen_bill_as ,
		agen_bill_code ,
		agen_tax_name ,
		agen_tax_addr1 ,
		agen_tax_addr2 ,
		agen_tax_phone ,
		agen_tax_fax ,
		agen_tax_email ,
		agen_tax_web ,
		agen_tax_collect ,
		agen_tax_reg ,
		agen_tax_regd ,
		agen_tax_id ,
		agen_pic ,
		agen_top ,
		agen_credit_limit ,
		agen_disc0 ,
		tcountry_code ,
		agen_type ,
		agen_client ,
		agen_lplmo ,
		agen_zone ,
		agen_deposit ,
		ageng_code ,
		agen_priority ,
		agen_blockd ,
		agen_remark ,
		non_active ,
		update_user ,
		update_date ,
		post_user ,
		post_date ,
		row_id ,
		agen_split ,
		formulir_code ,
		sales_code ,
		agen_dateend ,
		agen_com_addr3 ,
		agen_tax_addr3 ,
		disp_pkg_val ,
		qq_name ,
		is_direct_client ,
		agen_ofc_web ,
		agen_ofc_addr1 ,
		agen_ofc_addr2 ,
		agen_ofc_addr3 ,
		agen_ofc_phone ,
		agen_ofc_fax ,
		agen_ofc_email ,
		agen_tax_handphone ,
		agency_dob ,
		agen_com_handphone ,
		agen_ofc_pic ,
		agen_com_postcd ,
		agen_tax_postcd ,
		agen_ofc_postcd ,
		agen_ofc_handphone ,
		agen_com_addr1_full ,
		agen_tax_fax_full ,
		agen_com_addr2_full ,
		xcode ,
		entry_date ,
		entry_user 
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					agen_code,
					agen_com_name,
					agen_com_addr1,
					agen_com_addr2,
					agen_com_phone,
					agen_com_fax ,
					agen_com_email ,
					agen_com_web ,
					agen_bill_as ,
					agen_bill_code ,
					agen_tax_name ,
					agen_tax_addr1 ,
					agen_tax_addr2 ,
					agen_tax_phone ,
					agen_tax_fax ,
					agen_tax_email ,
					agen_tax_web ,
					agen_tax_collect ,
					agen_tax_reg ,
					agen_tax_regd ,
					agen_tax_id ,
					agen_pic ,
					agen_top ,
					agen_credit_limit ,
					agen_disc0 ,
					tcountry_code ,
					agen_type ,
					agen_client ,
					agen_lplmo ,
					agen_zone ,
					agen_deposit ,
					ageng_code ,
					agen_priority ,
					agen_blockd ,
					agen_remark ,
					non_active ,
					update_user ,
					update_date ,
					post_user ,
					post_date ,
					row_id ,
					agen_split ,
					formulir_code ,
					sales_code ,
					agen_dateend ,
					agen_com_addr3 ,
					agen_tax_addr3 ,
					disp_pkg_val ,
					qq_name ,
					is_direct_client ,
					agen_ofc_web ,
					agen_ofc_addr1 ,
					agen_ofc_addr2 ,
					agen_ofc_addr3 ,
					agen_ofc_phone ,
					agen_ofc_fax ,
					agen_ofc_email ,
					agen_tax_handphone ,
					agency_dob ,
					agen_com_handphone ,
					agen_ofc_pic ,
					agen_com_postcd ,
					agen_tax_postcd ,
					agen_ofc_postcd ,
					agen_ofc_handphone ,
					agen_com_addr1_full ,
					agen_tax_fax_full ,
					agen_com_addr2_full ,
					xcode ,
					entry_date ,
					entry_user  
				FROM gen21.mt_agen
			'
   		) tbl(
			agen_code varchar(20),
			agen_com_name varchar(60),
			agen_com_addr1 varchar(100),
			agen_com_addr2 varchar(100),
			agen_com_phone varchar(50),
			agen_com_fax varchar(50),
			agen_com_email varchar(100),
			agen_com_web varchar(60),
			agen_bill_as bpchar(1),
			agen_bill_code varchar(20),
			agen_tax_name varchar(100),
			agen_tax_addr1 varchar(100),
			agen_tax_addr2 varchar(100),
			agen_tax_phone varchar(50),
			agen_tax_fax varchar(50),
			agen_tax_email varchar(100),
			agen_tax_web varchar(60),
			agen_tax_collect bpchar(1),
			agen_tax_reg varchar(30),
			agen_tax_regd timestamp(0),
			agen_tax_id varchar(25),
			agen_pic varchar(50),
			agen_top int2,
			agen_credit_limit int8,
			agen_disc0 numeric(5, 2),
			tcountry_code varchar(3),
			agen_type bpchar(1),
			agen_client bpchar(1),
			agen_lplmo bpchar(1),
			agen_zone bpchar(1),
			agen_deposit bpchar(1),
			ageng_code varchar(10),
			agen_priority int4,
			agen_blockd timestamp(0),
			agen_remark varchar(1000),
			non_active timestamp(0),
			update_user varchar(10),
			update_date timestamp(0),
			post_user varchar(10),
			post_date timestamp(0),
			row_id varchar(18),
			agen_split bpchar(1),
			formulir_code varchar(2),
			sales_code varchar(5),
			agen_dateend timestamp(0),
			agen_com_addr3 varchar(100),
			agen_tax_addr3 varchar(100),
			disp_pkg_val varchar(1),
			qq_name varchar(50),
			is_direct_client varchar(1),
			agen_ofc_web varchar(50),
			agen_ofc_addr1 varchar(100),
			agen_ofc_addr2 varchar(100),
			agen_ofc_addr3 varchar(100),
			agen_ofc_phone varchar(50),
			agen_ofc_fax varchar(50),
			agen_ofc_email varchar(100),
			agen_tax_handphone varchar(50),
			agency_dob timestamp(0),
			agen_com_handphone varchar(50),
			agen_ofc_pic varchar(50),
			agen_com_postcd varchar(6),
			agen_tax_postcd varchar(6),
			agen_ofc_postcd varchar(6),
			agen_ofc_handphone varchar(50),
			agen_com_addr1_full varchar(100),
			agen_tax_fax_full varchar(50),
			agen_com_addr2_full varchar(100),
			xcode varchar(20),
			entry_date timestamp(0),
			entry_user varchar(20)
		)
with DATA
;
CREATE index idx_mt_agen_agen_code ON mt_agen (agen_code);
