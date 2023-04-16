DROP MATERIALIZED VIEW IF EXISTS tp_adnl_epi_plan;

CREATE materialized VIEW tp_adnl_epi_plan as
	SELECT 
		row_id_slot,
		row_id_epi,
		po_number,
		epi_no,
		revision_no,
		update_date,
		update_user,
		row_id,
		cbs_date,
		channel_code,
		run_id,
		run_split,
		run_repeat
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					row_id_slot,
					row_id_epi,
					po_number,
					epi_no,
					revision_no,
					update_date,
					update_user,
					row_id,
					cbs_date,
					channel_code,
					run_id,
					run_split,
					run_repeat
				FROM gen21.tp_adnl_epi_plan
			'
   		) tbl(
			row_id_slot varchar(18),
			row_id_epi varchar(18),
			po_number varchar(30),
			epi_no numeric,
			revision_no numeric,
			update_date timestamp(0),
			update_user varchar(10),
			row_id varchar(18),
			cbs_date timestamp(0),
			channel_code varchar(3),
			run_id numeric,
			run_split numeric,
			run_repeat numeric
		)
with DATA
;
--CREATE index idx_tp_adnl_epi_plan_custom1 ON tp_adnl_epi_plan (row_id_epi, revision_no);
CREATE index idx_tp_adnl_epi_plan_custom2 ON tp_adnl_epi_plan (row_id_slot, channel_code, cbs_date);
