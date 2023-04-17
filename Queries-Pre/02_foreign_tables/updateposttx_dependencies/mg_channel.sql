DROP MATERIALIZED VIEW IF EXISTS mg_channel cascade;

CREATE materialized VIEW mg_channel as
	SELECT 
		channel_code,
		channel_name,
		non_active,
		update_user,
		update_date,
		row_id,
		start_time,
		end_time,
		default_f,
		vat_per,
		mcr_channel_code,
		ch_group_code,
		ch_genre_code,
		passthrough_flag,
		catslot_code,
		playout_machine_code,
		is_vod,
		hd_sd_flag,
		frame_rate,
		simulcast,
		simulcast_main_chn
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'
				SELECT 
					channel_code,
					channel_name,
					non_active,
					update_user,
					update_date,
					row_id,
					start_time,
					end_time,
					default_f,
					vat_per,
					mcr_channel_code,
					ch_group_code,
					ch_genre_code,
					passthrough_flag,
					catslot_code,
					playout_machine_code,
					is_vod,
					hd_sd_flag,
					frame_rate,
					simulcast,
					simulcast_main_chn
				FROM gen21.mg_channel
			'
   		) tbl(
			channel_code varchar(3),
			channel_name varchar(40),
			non_active timestamp(0),
			update_user varchar(10),
			update_date timestamp(0),
			row_id varchar(18),
			start_time varchar(8),
			end_time varchar(8),
			default_f bpchar(1),
			vat_per numeric(5, 2),
			mcr_channel_code varchar(10),
			ch_group_code varchar(3),
			ch_genre_code varchar(3),
			passthrough_flag bpchar(1),
			catslot_code varchar(3),
			playout_machine_code varchar(5),
			is_vod varchar(1),
			hd_sd_flag varchar(2),
			frame_rate numeric,
			simulcast bpchar(1),
			simulcast_main_chn varchar(3)
		)
with DATA
;
CREATE index idx_mg_channel_channel_code ON mg_channel (channel_code);
