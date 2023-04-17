DROP MATERIALIZED VIEW IF EXISTS pur_episode_hdr cascade;

CREATE materialized VIEW pur_episode_hdr as
	SELECT 
		pur_contract_no,
		revision_no,
		row_id_film,
		film_epi,
		film_epi_title,
		epi_value,
		epi_format,
		material_qty,
		uom,
		delivery_sch_date,
		actual_rcvd_date,
		"comments",
		mat_loan_flag,
		update_user,
		update_date,
		row_id,
		rcvd_status,
		org_lang_code,
		review_status,
		reviewer_name,
		results,
		material_type,
		epi_home_val,
		alternate_title,
		org_name,
		dub,
		sub,
		dub_lang,
		sub_lang,
		mat_in_stock,
		promo,
		music_cue_sheet,
		trailer,
		insertmode,
		stls_no,
		length_epi,
		scripts,
		target_aud,
		brochures,
		script_arr_date,
		script_ret_date,
		brochure_arr_date,
		brochure_ret_date,
		censorboardcat,
		censorendlicinfo,
		print_location,
		synopsis,
		pattern_code,
		live_program,
		banner_epi_no,
		film_poc,
		row_id_poc,
		bannername,
		lic_start_date,
		lic_end_date,
		package_name,
		org_row_id,
		exp_runs,
		year_release,
		program_type,
		sub_type,
		color_bw,
		stars_film,
		directors,
		producers,
		grading,
		made_for,
		co_stars,
		play_used,
		production,
		tls_num,
		last_date,
		last_time,
		material_id,
		st_time,
		ed_time,
		temp_title,
		exchange_code,
		production_house,
		music_label,
		row_id_dummy,
		hold_lic_start,
		hold_lic_end,
		holiday_code,
		prize_code,
		quality_code,
		avail_start_date,
		avail_end_date,
		usage_code,
		remark,
		sch_comments,
		user_field1,
		user_field2,
		user_field3,
		budget_code,
		temp_programid,
		temp_licstartdt,
		temp_licenddt,
		pur_seqno,
		exchange_rate,
		currency_code,
		synopsis_bkup,
		row_id_epi,
		translator_name,
		translator_date,
		staff_name,
		staff_date,
		backup_no int8,
		backup_date,
		remark_subtitle,
		remark_dubbing,
		dubbing_date,
		row_id_amor,
		fm_comment,
		epi_add_date,
		status_eval,
		date_eval,
		ready_in_trans,
		mat_exp_arr_date,
		dub_required,
		subt_required,
		personality,
		music_director,
		ppn,
		pph,
		ppn_val,
		pph_val,
		exch_arr,
		epi_value_tax,
		add_cost,
		epi_no,
		epi_no_suff,
		film_epi_parent,
		split_flag,
		promo_pict bytea,
		file_name,
		file_type,
		old_path,
		deal_type,
		program_category,
		prog_id_old,
		epi_title_old,
		lic_end_date_temp,
		epi_value_temp,
		epi_home_value_temp,
		temp_prog_id_old,
		lic_start_date_temp,
		program_id,
		seq_num,
		"owner",
		prog_group,
		exp_runs_po,
		epi_po_flag,
		sap_material_id,
		sap_amt,
		run_repeat,
		is_row_id,
		run_org,
		day_repeat,
		hours_repeat,
		schn_repeat,
		max_repeat,
		run_license_flag,
		subtitling,
		snp,
		alt_title,
		season,
		amor_type,
		sales_flag,
		row_id_sales,
		contract_ref_num,
		flag_m,
		row_id_old,
		epk_avail_flag,
		url,
		sku,
		product_name
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					pur_contract_no,
					revision_no,
					row_id_film,
					film_epi,
					film_epi_title,
					epi_value,
					epi_format,
					material_qty,
					uom,
					delivery_sch_date,
					actual_rcvd_date,
					"comments",
					mat_loan_flag,
					update_user,
					update_date,
					row_id,
					rcvd_status,
					org_lang_code,
					review_status,
					reviewer_name,
					results,
					material_type,
					epi_home_val,
					alternate_title,
					org_name,
					dub,
					sub,
					dub_lang,
					sub_lang,
					mat_in_stock,
					promo,
					music_cue_sheet,
					trailer,
					insertmode,
					stls_no,
					length_epi,
					scripts,
					target_aud,
					brochures,
					script_arr_date,
					script_ret_date,
					brochure_arr_date,
					brochure_ret_date,
					censorboardcat,
					censorendlicinfo,
					print_location,
					synopsis,
					pattern_code,
					live_program,
					banner_epi_no,
					film_poc,
					row_id_poc,
					bannername,
					lic_start_date,
					lic_end_date,
					package_name,
					org_row_id,
					exp_runs,
					year_release,
					program_type,
					sub_type,
					color_bw,
					stars_film,
					directors,
					producers,
					grading,
					made_for,
					co_stars,
					play_used,
					production,
					tls_num,
					last_date,
					last_time,
					material_id,
					st_time,
					ed_time,
					temp_title,
					exchange_code,
					production_house,
					music_label,
					row_id_dummy,
					hold_lic_start,
					hold_lic_end,
					holiday_code,
					prize_code,
					quality_code,
					avail_start_date,
					avail_end_date,
					usage_code,
					remark,
					sch_comments,
					user_field1,
					user_field2,
					user_field3,
					budget_code,
					temp_programid,
					temp_licstartdt,
					temp_licenddt,
					pur_seqno,
					exchange_rate,
					currency_code,
					synopsis_bkup,
					row_id_epi,
					translator_name,
					translator_date,
					staff_name,
					staff_date,
					backup_no int8,
					backup_date,
					remark_subtitle,
					remark_dubbing,
					dubbing_date,
					row_id_amor,
					fm_comment,
					epi_add_date,
					status_eval,
					date_eval,
					ready_in_trans,
					mat_exp_arr_date,
					dub_required,
					subt_required,
					personality,
					music_director,
					ppn,
					pph,
					ppn_val,
					pph_val,
					exch_arr,
					epi_value_tax,
					add_cost,
					epi_no,
					epi_no_suff,
					film_epi_parent,
					split_flag,
					promo_pict bytea,
					file_name,
					file_type,
					old_path,
					deal_type,
					program_category,
					prog_id_old,
					epi_title_old,
					lic_end_date_temp,
					epi_value_temp,
					epi_home_value_temp,
					temp_prog_id_old,
					lic_start_date_temp,
					program_id,
					seq_num,
					"owner",
					prog_group,
					exp_runs_po,
					epi_po_flag,
					sap_material_id,
					sap_amt,
					run_repeat,
					is_row_id,
					run_org,
					day_repeat,
					hours_repeat,
					schn_repeat,
					max_repeat,
					run_license_flag,
					subtitling,
					snp,
					alt_title,
					season,
					amor_type,
					sales_flag,
					row_id_sales,
					contract_ref_num,
					flag_m,
					row_id_old,
					epk_avail_flag,
					url,
					sku,
					product_name
				FROM gen21.pur_episode_hdr
			'
   		) tbl(
			pur_contract_no varchar(20),
			revision_no numeric,
			row_id_film varchar(18),
			film_epi varchar(8),
			film_epi_title varchar(100),
			epi_value numeric(15, 2),
			epi_format varchar(30),
			material_qty numeric,
			uom varchar(10),
			delivery_sch_date timestamp(0),
			actual_rcvd_date timestamp(0),
			"comments" varchar(1000),
			mat_loan_flag bpchar(1),
			update_user varchar(30),
			update_date timestamp(0),
			row_id varchar(18),
			rcvd_status varchar(1),
			org_lang_code varchar(2),
			review_status varchar(10),
			reviewer_name varchar(30),
			results varchar(250),
			material_type varchar(3),
			epi_home_val numeric(15, 2),
			alternate_title varchar(50),
			org_name varchar(200),
			dub bpchar(1),
			sub bpchar(1),
			dub_lang varchar(2),
			sub_lang varchar(2),
			mat_in_stock bpchar(1),
			promo bpchar(1),
			music_cue_sheet bpchar(1),
			trailer bpchar(1),
			insertmode varchar(1),
			stls_no varchar(50),
			length_epi numeric,
			scripts varchar(1),
			target_aud varchar(10),
			brochures varchar(1),
			script_arr_date timestamp(0),
			script_ret_date timestamp(0),
			brochure_arr_date timestamp(0),
			brochure_ret_date timestamp(0),
			censorboardcat varchar(50),
			censorendlicinfo varchar(50),
			print_location varchar(50),
			synopsis varchar(4000),
			pattern_code varchar(10),
			live_program bpchar(1),
			banner_epi_no numeric,
			film_poc varchar(9),
			row_id_poc varchar(18),
			bannername varchar(40),
			lic_start_date timestamp(0),
			lic_end_date timestamp(0),
			package_name varchar(200),
			org_row_id varchar(18),
			exp_runs numeric,
			year_release numeric,
			program_type bpchar(4),
			sub_type varchar(2),
			color_bw bpchar(1),
			stars_film varchar(254),
			directors varchar(254),
			producers varchar(254),
			grading varchar(10),
			made_for bpchar(1),
			co_stars varchar(254),
			play_used numeric,
			production varchar(10),
			tls_num varchar(50),
			last_date timestamp(0),
			last_time varchar(20),
			material_id varchar(25),
			st_time varchar(20),
			ed_time varchar(20),
			temp_title varchar(50),
			exchange_code numeric,
			production_house varchar(100),
			music_label varchar(100),
			row_id_dummy varchar(18),
			hold_lic_start timestamp(0),
			hold_lic_end timestamp(0),
			holiday_code varchar(10),
			prize_code varchar(10),
			quality_code varchar(10),
			avail_start_date timestamp(0),
			avail_end_date timestamp(0),
			usage_code varchar(10),
			remark varchar(100),
			sch_comments varchar(254),
			user_field1 varchar(254),
			user_field2 varchar(254),
			user_field3 varchar(254),
			budget_code varchar(100),
			temp_programid varchar(20),
			temp_licstartdt varchar(20),
			temp_licenddt varchar(20),
			pur_seqno numeric,
			exchange_rate numeric(15, 2),
			currency_code varchar(10),
			synopsis_bkup varchar(4000),
			row_id_epi varchar(18),
			translator_name varchar(50),
			translator_date timestamp(0),
			staff_name varchar(50),
			staff_date timestamp(0),
			backup_no int8,
			backup_date timestamp(0),
			remark_subtitle varchar(250),
			remark_dubbing varchar(250),
			dubbing_date timestamp(0),
			row_id_amor varchar(18),
			fm_comment varchar(254),
			epi_add_date timestamp(0),
			status_eval varchar(2),
			date_eval timestamp(0),
			ready_in_trans varchar(1),
			mat_exp_arr_date timestamp(0),
			dub_required varchar(1),
			subt_required varchar(1),
			personality varchar(500),
			music_director varchar(254),
			ppn numeric(5, 2),
			pph numeric(5, 2),
			ppn_val numeric(15, 2),
			pph_val numeric(15, 2),
			exch_arr numeric(15, 2),
			epi_value_tax numeric(15, 2),
			add_cost numeric(15, 2),
			epi_no numeric,
			epi_no_suff varchar(5),
			film_epi_parent varchar(4),
			split_flag bpchar(1),
			promo_pict bytea,
			file_name varchar(100),
			file_type varchar(10),
			old_path varchar(100),
			deal_type varchar(6),
			program_category varchar(3),
			prog_id_old varchar(30),
			epi_title_old varchar(100),
			lic_end_date_temp varchar(8),
			epi_value_temp varchar(100),
			epi_home_value_temp varchar(100),
			temp_prog_id_old varchar(20),
			lic_start_date_temp varchar(20),
			program_id varchar(20),
			seq_num numeric(15, 2),
			"owner" varchar(3),
			prog_group varchar(2),
			exp_runs_po numeric,
			epi_po_flag bpchar(1),
			sap_material_id varchar(14),
			sap_amt numeric,
			run_repeat varchar(1),
			is_row_id varchar(18),
			run_org numeric,
			day_repeat numeric,
			hours_repeat numeric,
			schn_repeat bpchar(1),
			max_repeat numeric,
			run_license_flag varchar(1),
			subtitling varchar(1),
			snp bpchar(1),
			alt_title varchar(100),
			season varchar(100),
			amor_type varchar(1),
			sales_flag bpchar(1),
			row_id_sales varchar(18),
			contract_ref_num varchar(30),
			flag_m varchar(1),
			row_id_old varchar(18),
			epk_avail_flag bpchar(1),
			url varchar(300),
			sku varchar(50),
			product_name varchar(200)
		)
with DATA
;
--CREATE index idx_pur_episode_hdr_custom1 ON pur_episode_hdr (pur_contract_no, revision_no);
CREATE unique index idx_pur_episode_hdr_unique ON pur_episode_hdr (row_id, revision_no);
