DROP VIEW IF EXISTS view_master_program_v2;

CREATE OR REPLACE VIEW view_master_program_v2 AS 
	SELECT 
		mc.bms_id,
		mc.name
	FROM 
		dblink(
			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7', 
			'
				SELECT 
					DISTINCT(b.row_id) as bms_id, 
					film_poc_title as "name"
				FROM 
					gen21.tp_cbs_dps1 A
					LEFT OUTER JOIN gen21.mp_film B on B.row_id = A.row_id_poc and B.film_poc = A.film_poc
				order by film_poc_title
			'
		) mc(
			bms_id character varying(20), 
			name character varying(50)
		);