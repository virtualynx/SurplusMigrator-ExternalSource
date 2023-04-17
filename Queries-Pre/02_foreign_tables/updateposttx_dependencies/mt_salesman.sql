DROP MATERIALIZED VIEW IF EXISTS mt_salesman cascade;

CREATE materialized VIEW mt_salesman as
	SELECT 
		sales_code,
		sales_name,
		sales_nik,
		non_active,
		update_user,
		update_date,
		row_id,
		costc_code,
		phone_number,
		handphone,
		email,
		salesg_code,
		user_code
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					sales_code,
					sales_name,
					sales_nik,
					non_active,
					update_user,
					update_date,
					row_id,
					costc_code,
					phone_number,
					handphone,
					email,
					salesg_code,
					user_code
				FROM gen21.mt_salesman
			'
   		) tbl(
			sales_code varchar(5),
			sales_name varchar(40),
			sales_nik varchar(10),
			non_active timestamp(0),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			costc_code varchar(3),
			phone_number varchar(50),
			handphone varchar(50),
			email varchar(50),
			salesg_code varchar(3),
			user_code varchar(10)
		)
with DATA
;
CREATE index idx_mt_salesman_sales_code ON mt_salesman (sales_code);
