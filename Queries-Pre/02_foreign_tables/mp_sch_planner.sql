DROP MATERIALIZED VIEW IF EXISTS mp_sch_planner cascade;

CREATE materialized VIEW mp_sch_planner as
	SELECT 
		film_poc,
		row_id_poc,
		cbs_date,
		start_time,
		duration,
		end_time,
		film_poc_title,
		rgb_bg,
		rgb_fg,
		row_id,
		row_id_plan,
		row_id_epi,
		update_date,
		update_user,
		group_id,
		epi_no,
		revision_no,
		program_level,
		channel_code,
		config_icon_code,
		remark,
		ref_row_id,
		icon_code_1,
		icon_code_2,
		icon_code_3,
		icon_code_4,
		icon_code_5,
		icon_code_6,
		icon_code_7,
		icon_code_8,
		icon_code_9,
		icon_code_10,
		tx_code,
		cb_pattern_code
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					film_poc,
					row_id_poc,
					cbs_date,
					start_time,
					duration,
					end_time,
					film_poc_title,
					rgb_bg,
					rgb_fg,
					row_id,
					row_id_plan,
					row_id_epi,
					update_date,
					update_user,
					group_id,
					epi_no,
					revision_no,
					program_level,
					channel_code,
					config_icon_code,
					remark,
					ref_row_id,
					icon_code_1,
					icon_code_2,
					icon_code_3,
					icon_code_4,
					icon_code_5,
					icon_code_6,
					icon_code_7,
					icon_code_8,
					icon_code_9,
					icon_code_10,
					tx_code,
					cb_pattern_code
				FROM gen21.mp_sch_planner
			'
   		) tbl(
			film_poc varchar(9),
			row_id_poc varchar(18),
			cbs_date timestamp(0),
			start_time varchar(8),
			duration varchar(8),
			end_time varchar(8),
			film_poc_title varchar(40),
			rgb_bg numeric,
			rgb_fg numeric,
			row_id varchar(18),
			row_id_plan varchar(18),
			row_id_epi varchar(18),
			update_date timestamp(0),
			update_user varchar(10),
			group_id numeric,
			epi_no numeric,
			revision_no numeric,
			program_level bpchar(1),
			channel_code varchar(3),
			config_icon_code varchar(3),
			remark varchar(1000),
			ref_row_id varchar(18),
			icon_code_1 varchar(3),
			icon_code_2 varchar(3),
			icon_code_3 varchar(3),
			icon_code_4 varchar(3),
			icon_code_5 varchar(3),
			icon_code_6 varchar(3),
			icon_code_7 varchar(3),
			icon_code_8 varchar(3),
			icon_code_9 varchar(3),
			icon_code_10 varchar(3),
			tx_code varchar(5),
			cb_pattern_code varchar(10)
		)
with DATA
;
CREATE index idx_mp_sch_planner_cbs_date ON mp_sch_planner (cbs_date desc);
CREATE index idx_mp_sch_planner_row_id ON mp_sch_planner (row_id);
