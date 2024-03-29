DROP MATERIALIZED VIEW IF EXISTS tp_cbs_dps1 cascade;

CREATE materialized VIEW tp_cbs_dps1 as
	SELECT 
		channel_code,
		tx_code,
		cbs_date,
		slot_ttime,
		slot_dur_define,
		slot_dur_cb,
		slot_dur_pack,
		catslot_code,
		film_poc,
		row_id_poc,
		film_epi,
		slot_fixed,
		pack_code,
		slot_ok,
		house_no,
		tape_no,
		tape_duration,
		film_duration,
		machine_code,
		slot_rate,
		curr_code,
		rate_code,
		film_change,
		update_user,
		update_date,
		row_id,
		film_duration_s,
		film_duration_f,
		slot_dur_cb_s,
		slot_dur_cb_f,
		slot_dur_define_s,
		slot_dur_define_f,
		slot_dur_pack_s,
		slot_dur_pack_f,
		tape_duration_s,
		tape_duration_f,
		slot_seq,
		seg_seq,
		remark,
		slot_rate_code,
		program_type,
		cb_pattern_code,
		bonus_code,
		blocking_user,
		blocking_date,
		block_po_number,
		verified,
		po_no,
		epi_row_id,
		revision_no,
		rw,
		st_time,
		ed_time,
		rev_shrg_flag,
		bonus_flag,
		barter_flag,
		live_event,
		allow_ros,
		icon_code_1,
		icon_code_3,
		icon_code_4,
		icon_code_5,
		icon_code_6,
		icon_code_7,
		icon_code_8,
		icon_code_9,
		icon_code_10,
		icon_code_2,
		ref_row_id,
		backup_no,
		trf_slot_ttime,
		config_icon_code,
		row_id_sch,
		prodformat,
		group_id,
		slot_rate_value,
		slot_revision_no,
		program_level,
		ref_row_id_trf,
		inv_flag,
		off_air_flag,
		urn_uuid,
		slot_etime,
		trf_slot_duration,
		rate_update_user,
		rate_update_date,
		deleting_flag,
		split_slot,
		migration_data
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					channel_code,
					tx_code,
					cbs_date,
					slot_ttime,
					slot_dur_define,
					slot_dur_cb,
					slot_dur_pack,
					catslot_code,
					film_poc,
					row_id_poc,
					film_epi,
					slot_fixed,
					pack_code,
					slot_ok,
					house_no,
					tape_no,
					tape_duration,
					film_duration,
					machine_code,
					slot_rate,
					curr_code,
					rate_code,
					film_change,
					update_user,
					update_date,
					row_id,
					film_duration_s,
					film_duration_f,
					slot_dur_cb_s,
					slot_dur_cb_f,
					slot_dur_define_s,
					slot_dur_define_f,
					slot_dur_pack_s,
					slot_dur_pack_f,
					tape_duration_s,
					tape_duration_f,
					slot_seq,
					seg_seq,
					remark,
					slot_rate_code,
					program_type,
					cb_pattern_code,
					bonus_code,
					blocking_user,
					blocking_date,
					block_po_number,
					verified,
					po_no,
					epi_row_id,
					revision_no,
					rw,
					st_time,
					ed_time,
					rev_shrg_flag,
					bonus_flag,
					barter_flag,
					live_event,
					allow_ros,
					icon_code_1,
					icon_code_3,
					icon_code_4,
					icon_code_5,
					icon_code_6,
					icon_code_7,
					icon_code_8,
					icon_code_9,
					icon_code_10,
					icon_code_2,
					ref_row_id,
					backup_no,
					trf_slot_ttime,
					config_icon_code,
					row_id_sch,
					prodformat,
					group_id,
					slot_rate_value,
					slot_revision_no,
					program_level,
					ref_row_id_trf,
					inv_flag,
					off_air_flag,
					urn_uuid,
					slot_etime,
					trf_slot_duration,
					rate_update_user,
					rate_update_date,
					deleting_flag,
					split_slot,
					migration_data
				FROM gen21.tp_cbs_dps1
			'
   		) tbl(
			channel_code varchar(3),
			tx_code varchar(5),
			cbs_date timestamp(0),
			slot_ttime varchar(8),
			slot_dur_define varchar(8),
			slot_dur_cb varchar(8),
			slot_dur_pack varchar(8),
			catslot_code varchar(3),
			film_poc varchar(9),
			row_id_poc varchar(18),
			film_epi varchar(4),
			slot_fixed bpchar(1),
			pack_code varchar(5),
			slot_ok bpchar(1),
			house_no varchar(10),
			tape_no varchar(12),
			tape_duration varchar(8),
			film_duration varchar(8),
			machine_code varchar(5),
			slot_rate numeric(15, 2),
			curr_code varchar(5),
			rate_code varchar(2),
			film_change bpchar(1),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			film_duration_s int4,
			film_duration_f int2,
			slot_dur_cb_s int4,
			slot_dur_cb_f int2,
			slot_dur_define_s int4,
			slot_dur_define_f int2,
			slot_dur_pack_s int4,
			slot_dur_pack_f int2,
			tape_duration_s int4,
			tape_duration_f int2,
			slot_seq numeric,
			seg_seq int2,
			remark varchar(1000),
			slot_rate_code varchar(5),
			program_type varchar(5),
			cb_pattern_code varchar(10),
			bonus_code varchar(10),
			blocking_user varchar(10),
			blocking_date timestamp(0),
			block_po_number varchar(50),
			verified varchar(1),
			po_no varchar(30),
			epi_row_id varchar(18),
			revision_no numeric,
			rw numeric,
			st_time varchar(8),
			ed_time varchar(8),
			rev_shrg_flag varchar(1),
			bonus_flag varchar(1),
			barter_flag varchar(1),
			live_event varchar(1),
			allow_ros varchar(1),
			icon_code_1 varchar(3),
			icon_code_3 varchar(3),
			icon_code_4 varchar(3),
			icon_code_5 varchar(3),
			icon_code_6 varchar(3),
			icon_code_7 varchar(3),
			icon_code_8 varchar(3),
			icon_code_9 varchar(3),
			icon_code_10 varchar(3),
			icon_code_2 varchar(3),
			ref_row_id varchar(18),
			backup_no numeric,
			trf_slot_ttime varchar(8),
			config_icon_code varchar(3),
			row_id_sch varchar(18),
			prodformat varchar(5),
			group_id numeric,
			slot_rate_value numeric(20),
			slot_revision_no numeric,
			program_level bpchar(1),
			ref_row_id_trf varchar(18),
			inv_flag int2,
			off_air_flag varchar(1),
			urn_uuid varchar(36),
			slot_etime varchar(8),
			trf_slot_duration varchar(8),
			rate_update_user varchar(10),
			rate_update_date timestamp(0),
			deleting_flag varchar(1),
			split_slot varchar(1),
			migration_data varchar(1)
		)
with DATA
;
CREATE index idx_tp_cbs_dps1_row_id ON tp_cbs_dps1 (row_id);
