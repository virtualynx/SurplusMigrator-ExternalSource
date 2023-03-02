DROP MATERIALIZED VIEW IF EXISTS view_master_brand_temp;

CREATE MATERIALIZED VIEW view_master_brand_temp
TABLESPACE pg_default
AS 
SELECT 
	mp.prod_code AS advertiserbrandid,
    mp.prod_name AS name,
    mc.client_code AS advertiserid,
    mc.client_com_name AS advertiser_name,
    NULL::text AS agency_id,
    NULL::text AS agency_name
FROM 
	dblink('dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 '::text, 'SELECT prod_code, prod_name, client_code FROM gen21.mt_prod'::text) mp(prod_code character varying(20), prod_name character varying(50), client_code character varying(20))
	JOIN dblink('dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 'SELECT prod_code, client_code FROM gen21.mt_client_prod'::text) mcp(prod_code character varying(20), client_code character varying(20)) ON mcp.prod_code::text = mp.prod_code::text
	JOIN dblink('dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 'SELECT client_code, client_com_name FROM gen21.mt_client'::text) mc(client_code character varying(20), client_com_name character varying(40)) ON mc.client_code::text = mcp.client_code::text
WITH DATA;

-- View indexes:
CREATE INDEX idx_view_master_brand_temp_name_gin ON view_master_brand_temp USING gin (name gin_trgm_ops);
CREATE INDEX view_master_brand_temp_advertiserbrandid_idx ON view_master_brand_temp (advertiserbrandid);
CREATE INDEX view_master_brand_temp_advertiserid_idx ON view_master_brand_temp (advertiserid);
CREATE INDEX view_master_brand_temp_advertiseridadvertiserbrandid_idx ON view_master_brand_temp (advertiserid, advertiserbrandid);

select 
	vmbt.*,
	name <-> 'susu MORI'
from view_master_brand_temp vmbt  
where 
	name % 'susu MORI'
;