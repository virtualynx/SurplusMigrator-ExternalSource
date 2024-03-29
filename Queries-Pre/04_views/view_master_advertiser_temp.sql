DROP MATERIALIZED VIEW IF EXISTS view_master_advertiser_temp;

CREATE materialized VIEW view_master_advertiser_temp as
	SELECT 
		mc.client_code AS advertiserid,
    	mc.client_com_name AS name,
    	NULL AS agency_id,
    	NULL AS agency_name
   	FROM 
   		dblink(
   			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ', 
   			'SELECT client_code, client_com_name FROM gen21.mt_client'
   		) mc(
   			client_code character varying(20), 
   			client_com_name character varying(40)
		)
with DATA
;
CREATE index idx_view_master_advertiser_temp_advertiserid ON view_master_advertiser_temp (advertiserid);
CREATE index idx_view_master_advertiser_temp_name_gin ON view_master_advertiser_temp USING gin (name gin_trgm_ops);
CREATE INDEX view_master_advertiser_temp_name_idx ON view_master_advertiser_temp USING btree (name);

select 
	vmat.*,
	name <-> 'ASIA HEALTH' AS dist
from view_master_advertiser_temp vmat 
where 
--	name % 'ASIA HEALTH energy beverage, PT'
	name % 'ASIA HEALTH beverage'
;