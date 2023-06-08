DROP MATERIALIZED VIEW IF EXISTS mp_adnl_epi_plan cascade;

CREATE materialized VIEW mp_adnl_epi_plan as
	SELECT 
		row_id_sch,
		row_id_epi,
		po_number,
		epi_no,
		revision_no,
		update_date,
		update_user,
		row_id,
		run_id,
		run_split,
		run_repeat
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					row_id_sch,
					row_id_epi,
					po_number,
					epi_no,
					revision_no,
					update_date,
					update_user,
					row_id,
					run_id,
					run_split,
					run_repeat
				FROM gen21.mp_adnl_epi_plan
			'
   		) tbl(
			row_id_sch varchar(18),
			row_id_epi varchar(18),
			po_number varchar(30),
			epi_no numeric,
			revision_no numeric,
			update_date timestamp(0),
			update_user varchar(10),
			row_id varchar(18),
			run_id numeric,
			run_split numeric,
			run_repeat numeric
		)
with DATA
;
CREATE index idx_mp_adnl_epi_plan_row_id_sch ON mp_adnl_epi_plan (row_id_sch);
CREATE index idx_mp_adnl_epi_plan_row_id_epi ON mp_adnl_epi_plan (row_id_epi);
