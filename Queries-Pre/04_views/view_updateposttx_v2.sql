DROP materialized VIEW IF EXISTS view_updateposttx;

CREATE materialized VIEW view_updateposttx AS 
	SELECT 
		mcn.channel_name AS channel,
		tm1.tx_code AS region,
		tm1.po_number AS mo,
		tm1.mo_no AS contract,
		(('01' || to_char(tm1.mo_book_date, 'MMYYYY')) || '-') || to_char(last_day(tm1.mo_book_date), 'DDMMYYYY') AS period,
		( 
			SELECT mt_agen.agen_com_name
			FROM mt_agen
			WHERE mt_agen.agen_code = sr1.agen_code
		) AS agency,
		( 
			SELECT mt_client.client_com_name
			FROM mt_client
		  	WHERE mt_client.client_code = sr1.client_code
		) AS advertiser,
		( 
			SELECT mt_salesman.sales_name
		   	FROM mt_salesman
		  	WHERE mt_salesman.sales_code = sr1.sales_code
		) AS ae,
		( 
			SELECT mt_prod.prod_name
		   	FROM mt_prod
		  	WHERE mt_prod.prod_code = mp1.prod_code
		) AS brand,
		tm1.po_type AS "type",
		sr1.job_id AS package,
		tm1.mo_book_date AS actdate,
		f_time_format(
			COALESCE(
				( 
					SELECT tt_mo2.tx_time
			   		FROM tt_mo2
			  		WHERE tt_mo2.mo_no = tm1.mo_no AND tt_mo2.row_id_spot = tm1.row_id
				)
				, tm1.mo_book_time
			)
		) AS acttime,
		f_time_format(tm1.mo_book_time) AS schtime,
		tm1.mo_book_date AS schdate,
		mf.film_poc_title AS programme,
		f_get_episode(tcd1.channel_code, to_char(tcd1.cbs_date, 'YYYYMMDD'), tcd1.row_id, 'Y') AS episode,
		f_get_prod_version_name(mp1.prod_code, tm1.prod_version) AS version,
		f_jam_to_detik(mp1.prod_duration) AS length,
		(
			CASE WHEN tm1.for_pos_block = 'Y' THEN 
				NULL
			ELSE 
				tm1.mo_book_cb
			END 
		)::smallint AS pos,
		tm1.po_disc_home AS rate,
		0 AS priority,
		0 AS charge,
		(sr1.agency_discount / 100::numeric) AS discount,
		(sr1.agency_commission / 100::numeric) AS comission,
		(
			CASE WHEN tm1.verified = 'Y' THEN 
				'V'
			ELSE 
				'N'
			END
		)::text AS logstatus,
		NULL::text AS error,
		tm1.mo_dpp_home AS netsales,
		uuid_generate_v4()::character varying(36) AS id,
		to_char(tm1.mo_book_date, 'mm')::int AS month,
		to_char(tm1.mo_book_date, 'yyyy')::int AS year
	FROM 
		tt_mo1 tm1
		JOIN mg_channel mcn ON tm1.channel_code = mcn.channel_code
		JOIN st_reservations sr1 ON sr1.row_id = tm1.row_id_res
		JOIN st_reservation_matrix1 srm1 ON srm1.row_id = tm1.row_id_matrix1
		LEFT JOIN mp_film mf ON tm1.film_poc = mf.film_poc AND tm1.row_id_poc = mf.row_id
		LEFT JOIN tp_cbs_dps1 tcd1 ON tm1.row_id_slot = tcd1.row_id
		LEFT JOIN mt_prod1 mp1 ON tm1.prod_code = mp1.prod_code AND tm1.prod_version = mp1.prod_version
		LEFT JOIN st_pkg_int_hdr spkg ON sr1.rid_pkg_ext = spkg.row_id
	WHERE 
		tm1.channel_code::text = 'TV7' 
		AND tm1.mo_book_status = '2'
with DATA
;
		
CREATE index idx_view_updateposttx_custom1 ON view_updateposttx ("month", "year");