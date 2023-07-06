--DROP MATERIALIZED VIEW IF EXISTS mt_versiong cascade;
DROP VIEW IF EXISTS mt_versiong cascade;

--CREATE materialized VIEW mt_versiong as
CREATE VIEW mt_versiong as
	SELECT 
		prod_code,
		prod_version,
		rid_version,
		prodg_code,
		prodg_code1
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					prod_code,
					prod_version,
					rid_version,
					prodg_code,
					prodg_code1
				FROM gen21.mt_versiong
			'
   		) tbl(
			prod_code varchar(20),
			prod_version varchar(5),
			rid_version varchar(20),
			prodg_code varchar(5),
			prodg_code1 varchar(5)
		)
--with DATA
;
--CREATE index idx_mt_prod_prod_code ON mt_versiong (prod_code);
