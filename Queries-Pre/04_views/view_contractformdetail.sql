DROP VIEW IF EXISTS view_contractformdetail;

CREATE VIEW view_contractformdetail AS 
	SELECT 
		contractformid,
		contractformdetail_artist_code as artist_id
	FROM 
		dblink(
			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 
			'
				SELECT 
					contractform_id, 
					contractformdetail_line,
					contractformdetail_artist_code,
					contractformdetail_artist_name,
					contractformdetail_artist_address,
					contractformdetail_artist_ktp,
					contractformdetail_artist_npwp,
					contractformdetail_artist_phone
				FROM 
					e_legal.transaction_contractformdetail tcontractdetail
			'::text
		) tbl(
			contractformid varchar(50),
			contractformdetail_line int,
			contractformdetail_artist_code varchar(255),
			contractformdetail_artist_name varchar(255),
			contractformdetail_artist_address varchar(500),
			contractformdetail_artist_ktp varchar(255),
			contractformdetail_artist_npwp varchar(255),
			contractformdetail_artist_phone varchar(255)
		)
;

