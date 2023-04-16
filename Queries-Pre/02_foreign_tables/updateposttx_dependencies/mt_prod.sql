DROP MATERIALIZED VIEW IF EXISTS mt_prod;

CREATE materialized VIEW mt_prod as
	SELECT 
		prod_code,
		prod_name,
		prodg_code,
		prodg_code1,
		client_code,
		update_user,
		update_date,
		row_id,
		prod_dateend,
		old_prod_code,
		target_audience,
		entry_date,
		entry_user,
		prod_alt_name
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					prod_code,
					prod_name,
					prodg_code,
					prodg_code1,
					client_code,
					update_user,
					update_date,
					row_id,
					prod_dateend,
					old_prod_code,
					target_audience,
					entry_date,
					entry_user,
					prod_alt_name
				FROM gen21.mt_prod
			'
   		) tbl(
			prod_code varchar(20),
			prod_name varchar(50),
			prodg_code varchar(3),
			prodg_code1 varchar(3),
			client_code varchar(20),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			prod_dateend timestamp(0),
			old_prod_code varchar(20),
			target_audience varchar(20),
			entry_date timestamp(0),
			entry_user varchar(20),
			prod_alt_name varchar(100)
		)
with DATA
;
CREATE index idx_mt_prod_prod_code ON mt_prod (prod_code);
