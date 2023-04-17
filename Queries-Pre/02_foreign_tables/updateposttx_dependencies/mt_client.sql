DROP MATERIALIZED VIEW IF EXISTS mt_client cascade;

CREATE materialized VIEW mt_client as
	SELECT 
		client_code ,
		client_com_name ,
		client_com_addr1 ,
		client_com_addr2 ,
		client_com_phone ,
		client_com_fax ,
		client_com_email ,
		client_com_web ,
		client_pic ,
		clientg_code ,
		client_priority ,
		tcountry_code ,
		client_blockd ,
		client_deposit ,
		non_active ,
		update_user ,
		update_date ,
		row_id ,
		client_dateend ,
		client_com_addr3 ,
		client_direct_flag ,
		client_com_postcd ,
		clientname_full ,
		client_com_addr3_full ,
		entry_date ,
		entry_user ,
		xcode ,
		client_vat_no 
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					client_code ,
					client_com_name ,
					client_com_addr1 ,
					client_com_addr2 ,
					client_com_phone ,
					client_com_fax ,
					client_com_email ,
					client_com_web ,
					client_pic ,
					clientg_code ,
					client_priority ,
					tcountry_code ,
					client_blockd ,
					client_deposit ,
					non_active ,
					update_user ,
					update_date ,
					row_id ,
					client_dateend ,
					client_com_addr3 ,
					client_direct_flag ,
					client_com_postcd ,
					clientname_full ,
					client_com_addr3_full ,
					entry_date ,
					entry_user ,
					xcode ,
					client_vat_no 
				FROM gen21.mt_client
			'
   		) tbl(
			client_code varchar(20),
			client_com_name varchar(40),
			client_com_addr1 varchar(100),
			client_com_addr2 varchar(100),
			client_com_phone varchar(20),
			client_com_fax varchar(20),
			client_com_email varchar(100),
			client_com_web varchar(60),
			client_pic varchar(30),
			clientg_code varchar(10),
			client_priority int4,
			tcountry_code varchar(3),
			client_blockd timestamp(0),
			client_deposit bpchar(1),
			non_active timestamp(0),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			client_dateend timestamp(0),
			client_com_addr3 varchar(100),
			client_direct_flag bpchar(1),
			client_com_postcd varchar(6),
			clientname_full varchar(100),
			client_com_addr3_full varchar(100),
			entry_date timestamp(0),
			entry_user varchar(20),
			xcode varchar(20),
			client_vat_no varchar(50)
		)
with DATA
;
CREATE index idx_mt_client_client_code ON mt_client (client_code);
