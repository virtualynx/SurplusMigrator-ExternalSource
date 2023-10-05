CREATE OR REPLACE PROCEDURE insert_posttx(month_date int, year_date int)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
	created_timestamp timestamp WITHOUT time zone;
	record_data record;
	cursor_data cursor(month_date int, year_date int) for
		 SELECT 
--		    (tm1.mo_no || '-' || LPAD(tm1.spotnum::text, 5, '0') || '-' || mv.prodg_code1)::varchar(100) AS id,
		    (tm1.mo_no || '-' || LPAD(tm1.spotnum::text, 5, '0'))::varchar(100) AS id,
		    tm1.tx_code AS region,
		    tm1.po_number AS mo,
		    tm1.mo_no AS contract,
		    (('01' || to_char(tm1.mo_book_date, 'MMYYYY')) || '-') || to_char(last_day(tm1.mo_book_date), 'DDMMYYYY') AS "period",
		    tm1.po_type AS "type",
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
		    (
		        CASE WHEN tm1.verified = 'Y' THEN 
		            'V'
		        ELSE 
		            'N'
		        END
		    )::text AS logstatus,
		    NULL::text AS error,
		    tm1.mo_dpp_home::decimal AS netsales,
		    to_char(tm1.mo_book_date, 'mm')::int AS "month",
		    to_char(tm1.mo_book_date, 'yyyy')::int AS "year",
		    (select channel_name from mg_channel where channel_code = tm1.channel_code) AS channel,
		    ( 
		        SELECT mt_agen.agen_com_name
		        FROM mt_agen
		        WHERE mt_agen.agen_code = (select agen_code from st_reservations where row_id = tm1.row_id_res)
		    ) AS agency,
		    ( 
		        SELECT mt_client.client_com_name
		        FROM mt_client
		        WHERE mt_client.client_code = (select client_code from st_reservations where row_id = tm1.row_id_res)
		    ) AS advertiser,
		    ( 
		        SELECT mt_salesman.sales_name
		        FROM mt_salesman
		        WHERE mt_salesman.sales_code = (select sales_code from st_reservations where row_id = tm1.row_id_res)
		    ) AS ae,
		    (select job_id from st_reservations where row_id = tm1.row_id_res) AS package,
		    ((select agency_discount from st_reservations where row_id = tm1.row_id_res) / 100::numeric) AS discount,
		    ((select agency_commission from st_reservations where row_id = tm1.row_id_res) / 100::numeric) AS commission,
		    (select film_poc_title from mp_film where film_poc = tm1.film_poc and row_id = tm1.row_id_poc) AS programme,
		    (
		    	select episode 
		    	from posttx_episodes 
		    	where 
		    		cbs_date = tcd1.cbs_date
		    		and row_id = tcd1.row_id
		    		and channel_code = tcd1.channel_code 
			) AS episode,
		    (
		    	select "version" 
		    	from posttx_prod_versions 
		    	where 
		    		prod_code = mp1.prod_code
		    		and prod_version = tm1.prod_version
			) AS "version",
		    f_jam_to_detik(mp1.prod_duration) AS "length",
		    ( 
		        SELECT mt_prod.prod_name
		        FROM mt_prod
		        WHERE mt_prod.prod_code = mp1.prod_code
		    ) AS brand,
		    mp1.row_id
		FROM 
		    tt_mo1 tm1
		    LEFT JOIN tp_cbs_dps1 tcd1 ON tm1.row_id_slot = tcd1.row_id
		    LEFT JOIN mt_prod1 mp1 ON tm1.prod_code = mp1.prod_code AND tm1.prod_version = mp1.prod_version
		WHERE 
			date_part('year', tm1.mo_book_date) = year_date
		    and date_part('month', tm1.mo_book_date) = month_date
		    and tm1.mo_book_status = '2'
		    and tm1.channel_code = 'TV7'
	;
BEGIN
	created_timestamp := current_timestamp;

	-- create map for product-category
	drop table if exists temp_category;
	create temp table if not exists temp_category as
		SELECT 
			mv.rid_version ,
    		string_agg(mpg.prodg_name, ';' order by mpg.prodg_name) as prodg_name
        FROM 
    		(select distinct on(rid_version, prodg_code) * from mt_versiong) as mv
        	JOIN mt_prodg mpg ON mpg.prodg_code = mv.prodg_code
        group by mv.rid_version
	;
	CREATE INDEX temp_category_idx on temp_category(rid_version);
--	analyze temp_category;

	-- delete old data
	delete from "SL_Logproof"  
	where 
		"month" = month_date 
		and "year" = year_date
	;
	
	--open cursor
	open cursor_data(month_date, year_date);
	loop
		fetch cursor_data into record_data;
		exit when not found;
	
--		insert into table_update_post_tx(
		insert into "SL_Logproof" (
			"id",
			"region",
			"mo",
			"contract",
			"period",
			"type",
			"actdate",
			"acttime",
			"schtime",
			"schdate",
			"pos",
			"rate",
			"priority",
			"charge",
			"logstatus",
			"error",
			"netsales",
			"month",
			"year",
			"channel",
			"agency",
			"advertiser",
			"ae",
			"package",
			"discount",
			"commission",
			"programme",
			"episode",
			"version",
			"length",
			"brand",
--			"created_date"
			"prodg_name"
		) values (
			record_data."id",
			record_data."region",
			record_data."mo",
			record_data."contract",
			record_data."period",
			record_data."type",
			record_data."actdate",
			record_data."acttime",
			record_data."schtime",
			record_data."schdate",
			coalesce(record_data."pos", 0),
			record_data."rate",
			record_data."priority",
			record_data."charge",
			record_data."logstatus",
			record_data."error",
			record_data."netsales",
			record_data."month",
			record_data."year",
			record_data."channel",
			record_data."agency",
			record_data."advertiser",
			record_data."ae",
			record_data."package",
			record_data."discount",
			record_data."commission",
			record_data."programme",
			record_data."episode",
			record_data."version",
			record_data."length",
			record_data."brand",
--			created_timestamp
			(select prodg_name from temp_category where rid_version = record_data."row_id")
		);
	end loop;
	close cursor_data;

	-- delete old data
--	delete from table_update_post_tx 
--	where 
--		"month" = month_date 
--		and "year" = year_date
--		AND (
--			created_date is null
--			or created_date < created_timestamp
--		)
--	;
--	commit;
end;
$procedure$
SET search_path = <schema>
;
