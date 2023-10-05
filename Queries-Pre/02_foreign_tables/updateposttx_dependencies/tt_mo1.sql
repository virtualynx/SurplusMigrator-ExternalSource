DROP MATERIALIZED VIEW IF EXISTS tt_mo1 cascade;

CREATE materialized VIEW tt_mo1 as
	SELECT 
		channel_code,
		mo_no,
		tx_code,
		prod_code,
		prod_version,
		film_poc,
		row_id_poc,
		film_epi,
		mo_book_date,
		mo_book_time,
		mo_book_cb,
		mo_book_seq,
		mo_book_seq_start,
		mo_book_seq_promo,
		mo_cb_p,
		mo_seq_p,
		mo_seq_p_mst,
		rate_code,
		curr_code,
		rate_price_trx,
		rate_price_home,
		rate_price,
		slot_rate,
		mo_disc0_trx,
		mo_disc0_home,
		mo_dpp_trx,
		mo_dpp_home,
		mo_vat_trx,
		mo_vat_home,
		mo_adtax_trx,
		mo_adtax_home,
		prod_vclip,
		mo_count,
		pack_no,
		row_id_pack,
		row_id_pack_spot,
		mo_remark,
		mo_held,
		row_id_held,
		row_id_preemp,
		mo_book_status,
		update_user,
		update_date,
		row_id,
		held_count,
		row_id_slot,
		tt_mo2_flag,
		flag_rate,
		st_rate_code,
		ath_user,
		ath_date,
		ath_remark,
		row_id_slot_rate1,
		st_rate_amount,
		mo_user,
		billing,
		po_number,
		po_type,
		row_id_res,
		row_id_res1,
		row_id_matrix1,
		line_nu_res1,
		line_nu_mat1,
		row_id_pac1,
		special_pos,
		billed,
		verified,
		special_cb_pos,
		line_nu_pac1,
		mkgd_from_date,
		mkgd_from_prog,
		rejected,
		preemptnote_printed,
		orig_preempt_reason,
		copy_user,
		copy_date,
		nomakegood,
		for_pos_block,
		rateafterpremium,
		bumpableflag,
		can_change_value,
		bonus_calc,
		wrong_rate_preempt,
		bonus_taken,
		banner_reqd,
		bumpable_tc,
		priority,
		lateorderflag,
		subversionflag,
		mainversionno,
		bookingdatetime,
		schemecode,
		backupflag,
		rid_cb,
		rateprotectamt,
		reason_manual_id,
		reason_automatic_id,
		schobj_code,
		backup_no,
		row_id_backup,
		autoversionflag,
		po_disc_trx,
		po_disc_home,
		bef_ins_tt_dts1,
		chgrate_reason_id,
		chgrate_upd_user,
		chgrate_upd_date,
		spotnum,
		split_flag,
		seqpremamt,
		prembasedon,
		ros_flag,
		airtimefrom,
		airtimeto,
		price_percentadd,
		price_valueadd,
		flag_lateorder,
		cancelpo,
		cancelpodate,
		zero_rate,
		cancelreason,
		cancelby,
		canceldate,
		cancelremarks,
		canceltype,
		verify_user,
		verify_date,
		verify_remarks,
		rateprotectapply,
		premiummethod,
		rid_seqprem,
		ridflagrate,
		reproc_bonus,
		chgver_mode,
		slot_rev_number,
		slot_rev_row_id,
		bumpable_direct,
		urn_uuid,
		agency_rate_po_trx,
		fix_rate,
		agency_rate_po_home,
		change_banner_in_log,
		book_to_waitinglist,
		lo_number,
		lo_row_id,
		lo_verif_user,
		lo_verif_date,
		rate_price_po_trx,
		rate_price_po_home,
		mo_dpp_po_trx,
		mo_dpp_po_home,
		import_po,
		recon_key,
		migration_data,
		no_value,
		prem_pos_1,
		prem_pos_2,
		prem_pos_3,
		prem_pos_4,
		prem_pos_5,
		prem_pos_l1,
		prem_pos_l2,
		prem_pos_l3,
		prem_pos_l4,
		prem_pos_l5,
		prem_pos_lock,
		cancelporeceive
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					channel_code,
					mo_no,
					tx_code,
					prod_code,
					prod_version,
					film_poc,
					row_id_poc,
					film_epi,
					mo_book_date,
					mo_book_time,
					mo_book_cb,
					mo_book_seq,
					mo_book_seq_start,
					mo_book_seq_promo,
					mo_cb_p,
					mo_seq_p,
					mo_seq_p_mst,
					rate_code,
					curr_code,
					rate_price_trx,
					rate_price_home,
					rate_price,
					slot_rate,
					mo_disc0_trx,
					mo_disc0_home,
					mo_dpp_trx,
					mo_dpp_home,
					mo_vat_trx,
					mo_vat_home,
					mo_adtax_trx,
					mo_adtax_home,
					prod_vclip,
					mo_count,
					pack_no,
					row_id_pack,
					row_id_pack_spot,
					mo_remark,
					mo_held,
					row_id_held,
					row_id_preemp,
					mo_book_status,
					update_user,
					update_date,
					row_id,
					held_count,
					row_id_slot,
					tt_mo2_flag,
					flag_rate,
					st_rate_code,
					ath_user,
					ath_date,
					ath_remark,
					row_id_slot_rate1,
					st_rate_amount,
					mo_user,
					billing,
					po_number,
					po_type,
					row_id_res,
					row_id_res1,
					row_id_matrix1,
					line_nu_res1,
					line_nu_mat1,
					row_id_pac1,
					special_pos,
					billed,
					verified,
					special_cb_pos,
					line_nu_pac1,
					mkgd_from_date,
					mkgd_from_prog,
					rejected,
					preemptnote_printed,
					orig_preempt_reason,
					copy_user,
					copy_date,
					nomakegood,
					for_pos_block,
					rateafterpremium,
					bumpableflag,
					can_change_value,
					bonus_calc,
					wrong_rate_preempt,
					bonus_taken,
					banner_reqd,
					bumpable_tc,
					priority,
					lateorderflag,
					subversionflag,
					mainversionno,
					bookingdatetime,
					schemecode,
					backupflag,
					rid_cb,
					rateprotectamt,
					reason_manual_id,
					reason_automatic_id,
					schobj_code,
					backup_no,
					row_id_backup,
					autoversionflag,
					po_disc_trx,
					po_disc_home,
					bef_ins_tt_dts1,
					chgrate_reason_id,
					chgrate_upd_user,
					chgrate_upd_date,
					spotnum,
					split_flag,
					seqpremamt,
					prembasedon,
					ros_flag,
					airtimefrom,
					airtimeto,
					price_percentadd,
					price_valueadd,
					flag_lateorder,
					cancelpo,
					cancelpodate,
					zero_rate,
					cancelreason,
					cancelby,
					canceldate,
					cancelremarks,
					canceltype,
					verify_user,
					verify_date,
					verify_remarks,
					rateprotectapply,
					premiummethod,
					rid_seqprem,
					ridflagrate,
					reproc_bonus,
					chgver_mode,
					slot_rev_number,
					slot_rev_row_id,
					bumpable_direct,
					urn_uuid,
					agency_rate_po_trx,
					fix_rate,
					agency_rate_po_home,
					change_banner_in_log,
					book_to_waitinglist,
					lo_number,
					lo_row_id,
					lo_verif_user,
					lo_verif_date,
					rate_price_po_trx,
					rate_price_po_home,
					mo_dpp_po_trx,
					mo_dpp_po_home,
					import_po,
					recon_key,
					migration_data,
					no_value,
					prem_pos_1,
					prem_pos_2,
					prem_pos_3,
					prem_pos_4,
					prem_pos_5,
					prem_pos_l1,
					prem_pos_l2,
					prem_pos_l3,
					prem_pos_l4,
					prem_pos_l5,
					prem_pos_lock,
					cancelporeceive
				FROM gen21.tt_mo1
				WHERE
	   				(CURRENT_DATE - ''1 year''::interval year) <= mo_book_date 
					AND mo_book_status = ''2''
					AND channel_code::text = ''TV7''
			'
   		) tbl(
			channel_code varchar(3),
			mo_no varchar(20),
			tx_code varchar(5),
			prod_code varchar(20),
			prod_version varchar(5),
			film_poc varchar(9),
			row_id_poc varchar(18),
			film_epi varchar(4),
			mo_book_date timestamp(0),
			mo_book_time varchar(8),
			mo_book_cb int2,
			mo_book_seq int2,
			mo_book_seq_start bpchar(1),
			mo_book_seq_promo bpchar(1),
			mo_cb_p numeric(5, 2),
			mo_seq_p numeric(5, 2),
			mo_seq_p_mst numeric(5, 2),
			rate_code varchar(5),
			curr_code varchar(5),
			rate_price_trx numeric(15, 2),
			rate_price_home numeric(15, 2),
			rate_price numeric(15, 2),
			slot_rate numeric(15, 2),
			mo_disc0_trx numeric(15, 2),
			mo_disc0_home numeric(15, 2),
			mo_dpp_trx numeric(15, 2),
			mo_dpp_home numeric(15, 2),
			mo_vat_trx numeric(15, 2),
			mo_vat_home numeric(15, 2),
			mo_adtax_trx numeric(15, 2),
			mo_adtax_home numeric(15, 2),
			prod_vclip bpchar(1),
			mo_count int2,
			pack_no varchar(30),
			row_id_pack varchar(18),
			row_id_pack_spot varchar(18),
			mo_remark varchar(1000),
			mo_held varchar(1000),
			row_id_held varchar(18),
			row_id_preemp varchar(18),
			mo_book_status bpchar(1),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			held_count int2,
			row_id_slot varchar(18),
			tt_mo2_flag bpchar(1),
			flag_rate varchar(20),
			st_rate_code varchar(5),
			ath_user varchar(10),
			ath_date timestamp(0),
			ath_remark varchar(100),
			row_id_slot_rate1 varchar(18),
			st_rate_amount numeric(15, 2),
			mo_user varchar(10),
			billing varchar(1),
			po_number varchar(50),
			po_type varchar(15),
			row_id_res varchar(18),
			row_id_res1 varchar(18),
			row_id_matrix1 varchar(18),
			line_nu_res1 int4,
			line_nu_mat1 int4,
			row_id_pac1 varchar(18),
			special_pos numeric,
			billed varchar(1),
			verified varchar(1),
			special_cb_pos int2,
			line_nu_pac1 int4,
			mkgd_from_date timestamp(0),
			mkgd_from_prog varchar(50),
			rejected bpchar(1),
			preemptnote_printed varchar(1),
			orig_preempt_reason varchar(50),
			copy_user varchar(10),
			copy_date timestamp(0),
			nomakegood varchar(1),
			for_pos_block varchar(1),
			rateafterpremium numeric(15, 2),
			bumpableflag bpchar(1),
			can_change_value bpchar(1),
			bonus_calc bpchar(1),
			wrong_rate_preempt bpchar(1),
			bonus_taken bpchar(1),
			banner_reqd bpchar(1),
			bumpable_tc bpchar(1),
			priority bpchar(5),
			lateorderflag bpchar(1),
			subversionflag bpchar(1),
			mainversionno varchar(10),
			bookingdatetime timestamp(0),
			schemecode varchar(5),
			backupflag bpchar(1),
			rid_cb varchar(20),
			rateprotectamt numeric(15, 2),
			reason_manual_id varchar(10),
			reason_automatic_id varchar(10),
			schobj_code varchar(5),
			backup_no numeric,
			row_id_backup varchar(20),
			autoversionflag bpchar(1),
			po_disc_trx numeric(15, 2),
			po_disc_home numeric(15, 2),
			bef_ins_tt_dts1 bpchar(1),
			chgrate_reason_id varchar(10),
			chgrate_upd_user varchar(10),
			chgrate_upd_date timestamp(0),
			spotnum numeric,
			split_flag bpchar(1),
			seqpremamt numeric(15, 2),
			prembasedon bpchar(1),
			ros_flag bpchar(1),
			airtimefrom varchar(8),
			airtimeto varchar(8),
			price_percentadd numeric(5, 2),
			price_valueadd numeric(15, 2),
			flag_lateorder bpchar(1),
			cancelpo varchar(50),
			cancelpodate timestamp(0),
			zero_rate bpchar(1),
			cancelreason varchar(200),
			cancelby varchar(10),
			canceldate timestamp(0),
			cancelremarks varchar(200),
			canceltype bpchar(1),
			verify_user varchar(10),
			verify_date timestamp(0),
			verify_remarks varchar(300),
			rateprotectapply bpchar(1),
			premiummethod bpchar(1),
			rid_seqprem varchar(20),
			ridflagrate varchar(20),
			reproc_bonus bpchar(1),
			chgver_mode bpchar(1),
			slot_rev_number numeric,
			slot_rev_row_id varchar(18),
			bumpable_direct bpchar(1),
			urn_uuid varchar(36),
			agency_rate_po_trx numeric(15, 2),
			fix_rate bpchar(1),
			agency_rate_po_home numeric(15, 2),
			change_banner_in_log bpchar(1),
			book_to_waitinglist bpchar(1),
			lo_number varchar(50),
			lo_row_id varchar(18),
			lo_verif_user varchar(10),
			lo_verif_date timestamp(0),
			rate_price_po_trx numeric(15, 2),
			rate_price_po_home numeric(15, 2),
			mo_dpp_po_trx numeric(15, 2),
			mo_dpp_po_home numeric(15, 2),
			import_po varchar(1),
			recon_key varchar(20),
			migration_data varchar(1),
			no_value varchar(1),
			prem_pos_1 varchar(1),
			prem_pos_2 varchar(1),
			prem_pos_3 varchar(1),
			prem_pos_4 varchar(1),
			prem_pos_5 varchar(1),
			prem_pos_l1 varchar(1),
			prem_pos_l2 varchar(1),
			prem_pos_l3 varchar(1),
			prem_pos_l4 varchar(1),
			prem_pos_l5 varchar(1),
			prem_pos_lock varchar(1),
			cancelporeceive varchar(20)
		)
with DATA
;
--CREATE index idx_tt_mo1_custom1 ON tt_mo1 (channel_code, mo_book_status);
--CREATE index idx_tt_mo1_custom2 ON tt_mo1 (date_part('month', mo_book_date), date_part('year', mo_book_date));
--CREATE index idx_tt_mo1_custom3 ON tt_mo1 (channel_code, mo_book_status, date_part('month', mo_book_date), date_part('year', mo_book_date));
--CREATE index idx_tt_mo1_custom4 ON tt_mo1 ( (tm1.mo_no || '-' || LPAD(tm1.spotnum::text, 5, '0')) );
CREATE index idx_tt_mo1_custom5 ON tt_mo1 (date_part('year', mo_book_date) desc, date_part('month', mo_book_date) desc, mo_book_status, channel_code);
CREATE index idx_tt_mo1_custom6 ON tt_mo1 (mo_book_date desc, mo_book_status, channel_code);
CREATE index idx_tt_mo1_row_id_slot ON tt_mo1 (row_id_slot);
CREATE unique index idx_tt_mo1_unique ON tt_mo1 (mo_no, spotnum);
