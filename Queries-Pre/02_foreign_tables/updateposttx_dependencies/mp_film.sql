DROP MATERIALIZED VIEW IF EXISTS mp_film cascade;

CREATE materialized VIEW mp_film as
	SELECT 
		film_ipoc,
		film_poc,
		film_poc_title,
		film_licen_dfrom,
		film_licen_dto,
		film_licen_run,
		lang_code,
		film_production,
		film_action_need,
		film_color,
		catgenre_code,
		catsri_code,
		catslot_code,
		film_epi_total,
		film_epi_start,
		film_amount_trx,
		film_amount_home,
		film_sharing,
		film_drama,
		update_user,
		update_date,
		row_id,
		curr_code,
		distri_code,
		run1,
		run2,
		run3,
		run4,
		run5,
		p_sharing,
		"cast",
		director,
		synopsys,
		remarks,
		rev_share,
		r_sharing,
		at_share,
		a_share,
		epi_to,
		b_time,
		bonus_code,
		running_time,
		free_rights,
		copy_source,
		production_date,
		copy_reason,
		revision_no,
		row_id_film,
		slot_rate,
		length_per_episode,
		year_release,
		program_type,
		sub_type,
		original_cost,
		shared_cost,
		sctv_cost,
		grn,
		mat_loan_flag,
		iden_flag,
		material_type,
		color,
		txn_id,
		txn_date,
		package_name,
		producers,
		stars_film,
		co_stars,
		grading,
		made_for,
		target_aud,
		use_restrictions,
		live_program,
		banner_epi_max_no,
		cat_code,
		cat_group_code,
		tvr,
		cprp,
		bonus_flag,
		barter_flag,
		live_event,
		allow_ros,
		cb_pattern_code,
		prodformat,
		row_id_old
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					film_ipoc,
					film_poc,
					film_poc_title,
					film_licen_dfrom,
					film_licen_dto,
					film_licen_run,
					lang_code,
					film_production,
					film_action_need,
					film_color,
					catgenre_code,
					catsri_code,
					catslot_code,
					film_epi_total,
					film_epi_start,
					film_amount_trx,
					film_amount_home,
					film_sharing,
					film_drama,
					update_user,
					update_date,
					row_id,
					curr_code,
					distri_code,
					run1,
					run2,
					run3,
					run4,
					run5,
					p_sharing,
					"cast",
					director,
					synopsys,
					remarks,
					rev_share,
					r_sharing,
					at_share,
					a_share,
					epi_to,
					b_time,
					bonus_code,
					running_time,
					free_rights,
					copy_source,
					production_date,
					copy_reason,
					revision_no,
					row_id_film,
					slot_rate,
					length_per_episode,
					year_release,
					program_type,
					sub_type,
					original_cost,
					shared_cost,
					sctv_cost,
					grn,
					mat_loan_flag,
					iden_flag,
					material_type,
					color,
					txn_id,
					txn_date,
					package_name,
					producers,
					stars_film,
					co_stars,
					grading,
					made_for,
					target_aud,
					use_restrictions,
					live_program,
					banner_epi_max_no,
					cat_code,
					cat_group_code,
					tvr,
					cprp,
					bonus_flag,
					barter_flag,
					live_event,
					allow_ros,
					cb_pattern_code,
					prodformat,
					row_id_old
				FROM gen21.mp_film
			'
   		) tbl(
			film_ipoc varchar(30),
			film_poc varchar(9),
			film_poc_title varchar(40),
			film_licen_dfrom timestamp(0),
			film_licen_dto timestamp(0),
			film_licen_run int2,
			lang_code varchar(2),
			film_production varchar(4),
			film_action_need bpchar(1),
			film_color varchar(1),
			catgenre_code varchar(4),
			catsri_code varchar(3),
			catslot_code varchar(3),
			film_epi_total int2,
			film_epi_start int2,
			film_amount_trx numeric(15, 2),
			film_amount_home numeric(15, 2),
			film_sharing varchar(1),
			film_drama varchar(1),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			curr_code varchar(5),
			distri_code varchar(6),
			run1 numeric,
			run2 numeric,
			run3 numeric,
			run4 numeric,
			run5 numeric,
			p_sharing numeric(5, 2),
			"cast" varchar(254),
			director varchar(254),
			synopsys varchar(4000),
			remarks varchar(254),
			rev_share bpchar(1),
			r_sharing numeric(5, 2),
			at_share bpchar(1),
			a_share numeric(5, 2),
			epi_to numeric,
			b_time bpchar(1),
			bonus_code varchar(10),
			running_time numeric,
			free_rights bpchar(1),
			copy_source varchar(10),
			production_date timestamp(0),
			copy_reason varchar(10),
			revision_no numeric,
			row_id_film varchar(18),
			slot_rate varchar(5),
			length_per_episode numeric,
			year_release numeric,
			program_type varchar(4),
			sub_type varchar(2),
			original_cost numeric,
			shared_cost numeric,
			sctv_cost numeric,
			grn varchar(10),
			mat_loan_flag bpchar(1),
			iden_flag bpchar(1),
			material_type bpchar(1),
			color bpchar(1),
			txn_id varchar(30),
			txn_date timestamp(0),
			package_name varchar(200),
			producers varchar(254),
			stars_film varchar(254),
			co_stars varchar(254),
			grading varchar(100),
			made_for bpchar(1),
			target_aud varchar(100),
			use_restrictions varchar(254),
			live_program bpchar(1),
			banner_epi_max_no numeric,
			cat_code varchar(10),
			cat_group_code varchar(10),
			tvr numeric(10, 2),
			cprp numeric(10, 2),
			bonus_flag varchar(1),
			barter_flag varchar(1),
			live_event varchar(1),
			allow_ros varchar(1),
			cb_pattern_code varchar(10),
			prodformat varchar(5),
			row_id_old varchar(18)
		)
with DATA
;
CREATE index idx_mp_film_film_poc ON mp_film (film_poc);
