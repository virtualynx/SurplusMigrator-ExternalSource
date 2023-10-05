CREATE OR REPLACE VIEW view_gen21_brand_productcategory as
	SELECT 
		distinct on(mp.prod_code, mpg.prodg_code)
		mp.prod_code,
		mp.prod_name as brand,
		mpg.prodg_code,
	    mpg.prodg_name
	FROM 
		mt_prod mp
	    LEFT join mt_prod1 mp1 ON mp1.prod_code = mp.prod_code
	    left join mt_versiong mv on mv.rid_version = mp1.row_id
		left JOIN mt_prodg mpg ON mpg.prodg_code = mv.prodg_code
	WHERE 
		mpg.prodg_code is not null
;