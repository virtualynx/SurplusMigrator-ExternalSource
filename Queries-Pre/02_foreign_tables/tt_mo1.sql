DROP FOREIGN TABLE IF EXISTS tt_mo1;

CREATE FOREIGN TABLE tt_mo1 (
	channel_code varchar(3) OPTIONS(key 'true') NOT NULL,
	mo_no varchar(20) OPTIONS(key 'true') NOT NULL,
	tx_code varchar(5) NULL,
	prod_code varchar(20) NULL,
	prod_version varchar(5) NULL,
	film_poc varchar(9) NULL,
	row_id_poc varchar(18) NULL,
	film_epi varchar(4) NULL,
	mo_book_date timestamp(0) NULL,
	mo_book_time varchar(8) NULL,
	mo_book_cb int2 NULL,
	mo_book_seq int2 NULL,
	mo_book_seq_start bpchar(1) NULL,
	mo_book_seq_promo bpchar(1) NULL,
	mo_cb_p numeric(5, 2) NULL,
	mo_seq_p numeric(5, 2) NULL,
	mo_seq_p_mst numeric(5, 2) NULL,
	rate_code varchar(5) NULL,
	curr_code varchar(5) NULL,
	rate_price_trx numeric(15, 2) NULL,
	rate_price_home numeric(15, 2) NULL,
	rate_price numeric(15, 2) NULL,
	slot_rate numeric(15, 2) NULL,
	mo_disc0_trx numeric(15, 2) NULL,
	mo_disc0_home numeric(15, 2) NULL,
	mo_dpp_trx numeric(15, 2) NULL,
	mo_dpp_home numeric(15, 2) NULL,
	mo_vat_trx numeric(15, 2) NULL,
	mo_vat_home numeric(15, 2) NULL,
	mo_adtax_trx numeric(15, 2) NULL,
	mo_adtax_home numeric(15, 2) NULL,
	prod_vclip bpchar(1) NULL,
	mo_count int2 NULL,
	pack_no varchar(30) NULL,
	row_id_pack varchar(18) NULL,
	row_id_pack_spot varchar(18) NULL,
	mo_remark varchar(1000) NULL,
	mo_held varchar(1000) NULL,
	row_id_held varchar(18) NULL,
	row_id_preemp varchar(18) NULL,
	mo_book_status bpchar(1) NULL,
	update_user varchar(10) NOT NULL,
	update_date timestamp(0) NOT NULL,
	row_id varchar(18) OPTIONS(key 'true') NOT NULL,
	held_count int2 NULL,
	row_id_slot varchar(18) NULL,
	tt_mo2_flag bpchar(1) NULL,
	flag_rate varchar(20) NULL,
	st_rate_code varchar(5) NULL,
	ath_user varchar(10) NULL,
	ath_date timestamp(0) NULL,
	ath_remark varchar(100) NULL,
	row_id_slot_rate1 varchar(18) NULL,
	st_rate_amount numeric(15, 2) NULL,
	mo_user varchar(10) NULL,
	billing varchar(1) NULL,
	po_number varchar(50) OPTIONS(key 'true') NOT NULL,
	po_type varchar(15) NULL,
	row_id_res varchar(18) NULL,
	row_id_res1 varchar(18) NULL,
	row_id_matrix1 varchar(18) NULL,
	line_nu_res1 int4 NULL,
	line_nu_mat1 int4 NULL,
	row_id_pac1 varchar(18) NULL,
	special_pos numeric NULL,
	billed varchar(1) NULL,
	verified varchar(1) NULL,
	special_cb_pos int2 NULL,
	line_nu_pac1 int4 NULL,
	mkgd_from_date timestamp(0) NULL,
	mkgd_from_prog varchar(50) NULL,
	rejected bpchar(1) NULL,
	preemptnote_printed varchar(1) NULL,
	orig_preempt_reason varchar(50) NULL,
	copy_user varchar(10) NULL,
	copy_date timestamp(0) NULL,
	nomakegood varchar(1) NULL,
	for_pos_block varchar(1) NULL,
	rateafterpremium numeric(15, 2) NULL,
	bumpableflag bpchar(1) NOT NULL,
	can_change_value bpchar(1) NOT NULL,
	bonus_calc bpchar(1) NOT NULL,
	wrong_rate_preempt bpchar(1) NOT NULL,
	bonus_taken bpchar(1) NOT NULL,
	banner_reqd bpchar(1) NOT NULL,
	bumpable_tc bpchar(1) NOT NULL,
	priority bpchar(5) NOT NULL,
	lateorderflag bpchar(1) NULL,
	subversionflag bpchar(1) NULL,
	mainversionno varchar(10) NULL,
	bookingdatetime timestamp(0) NULL,
	schemecode varchar(5) NULL,
	backupflag bpchar(1) NOT NULL,
	rid_cb varchar(20) NULL,
	rateprotectamt numeric(15, 2) NULL,
	reason_manual_id varchar(10) NULL,
	reason_automatic_id varchar(10) NULL,
	schobj_code varchar(5) NULL,
	backup_no numeric NULL,
	row_id_backup varchar(20) NULL,
	autoversionflag bpchar(1) NULL,
	po_disc_trx numeric(15, 2) NULL,
	po_disc_home numeric(15, 2) NULL,
	bef_ins_tt_dts1 bpchar(1) NULL,
	chgrate_reason_id varchar(10) NULL,
	chgrate_upd_user varchar(10) NULL,
	chgrate_upd_date timestamp(0) NULL,
	spotnum numeric NULL,
	split_flag bpchar(1) NULL,
	seqpremamt numeric(15, 2) NULL,
	prembasedon bpchar(1) NULL,
	ros_flag bpchar(1) NULL,
	airtimefrom varchar(8) NULL,
	airtimeto varchar(8) NULL,
	price_percentadd numeric(5, 2) NULL,
	price_valueadd numeric(15, 2) NULL,
	flag_lateorder bpchar(1) NULL,
	cancelpo varchar(50) NULL,
	cancelpodate timestamp(0) NULL,
	zero_rate bpchar(1) NOT NULL,
	cancelreason varchar(200) NULL,
	cancelby varchar(10) NULL,
	canceldate timestamp(0) NULL,
	cancelremarks varchar(200) NULL,
	canceltype bpchar(1) NULL,
	verify_user varchar(10) NULL,
	verify_date timestamp(0) NULL,
	verify_remarks varchar(300) NULL,
	rateprotectapply bpchar(1) NOT NULL,
	premiummethod bpchar(1) NULL,
	rid_seqprem varchar(20) NULL,
	ridflagrate varchar(20) NULL,
	reproc_bonus bpchar(1) NULL,
	chgver_mode bpchar(1) NULL,
	slot_rev_number numeric NULL,
	slot_rev_row_id varchar(18) NULL,
	bumpable_direct bpchar(1) NULL,
	urn_uuid varchar(36) NOT NULL,
	agency_rate_po_trx numeric(15, 2) NULL,
	fix_rate bpchar(1) NULL,
	agency_rate_po_home numeric(15, 2) NULL,
	change_banner_in_log bpchar(1) NULL,
	book_to_waitinglist bpchar(1) NULL,
	lo_number varchar(50) NULL,
	lo_row_id varchar(18) NULL,
	lo_verif_user varchar(10) NULL,
	lo_verif_date timestamp(0) NULL,
	rate_price_po_trx numeric(15, 2) NULL,
	rate_price_po_home numeric(15, 2) NULL,
	mo_dpp_po_trx numeric(15, 2) NULL,
	mo_dpp_po_home numeric(15, 2) NULL,
	import_po varchar(1) NULL,
	recon_key varchar(20) NULL,
	migration_data varchar(1) NULL,
	no_value varchar(1) NULL,
	prem_pos_1 varchar(1) NOT NULL,
	prem_pos_2 varchar(1) NOT NULL,
	prem_pos_3 varchar(1) NOT NULL,
	prem_pos_4 varchar(1) NOT NULL,
	prem_pos_5 varchar(1) NOT NULL,
	prem_pos_l1 varchar(1) NOT NULL,
	prem_pos_l2 varchar(1) NOT NULL,
	prem_pos_l3 varchar(1) NOT NULL,
	prem_pos_l4 varchar(1) NOT NULL,
	prem_pos_l5 varchar(1) NOT NULL,
	prem_pos_lock varchar(1) NOT NULL,
	cancelporeceive varchar(20) NULL
)
SERVER gen21
OPTIONS (schema 'GEN21_TRANS7', table 'TT_MO1');