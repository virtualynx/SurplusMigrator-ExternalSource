DROP MATERIALIZED VIEW IF EXISTS posttx_prod_versions;

CREATE materialized VIEW posttx_prod_versions as
	select distinct 
		prod_code, 
		prod_version,
		f_get_prod_version_name(prod_code, prod_version) AS "version"
	FROM 
		mt_prod1
with DATA
;
CREATE index idx_posttx_prod_versions_custom1 ON posttx_prod_versions (prod_code, prod_version);
