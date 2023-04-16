DROP MATERIALIZED VIEW IF EXISTS posttx_episodes;

CREATE materialized VIEW posttx_episodes as
    SELECT 
		row_id,
		cbs_date,
		channel_code,
		f_get_episode(channel_code, to_char(cbs_date, 'YYYYMMDD'), row_id, 'Y') AS episode
	FROM 
		tp_cbs_dps1
with DATA
;
CREATE unique index idx_posttx_episodes_unique ON posttx_episodes (cbs_date desc, row_id, channel_code);
