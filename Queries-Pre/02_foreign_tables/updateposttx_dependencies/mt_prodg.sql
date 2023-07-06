DROP VIEW IF EXISTS mt_prodg cascade;

CREATE VIEW mt_prodg as
	SELECT 
		prodg_code,
		prodg_name
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					prodg_code,
					prodg_name
				FROM gen21.mt_prodg
			'
   		) tbl(
			prodg_code varchar(3),
			prodg_name varchar(60)
		)
;
