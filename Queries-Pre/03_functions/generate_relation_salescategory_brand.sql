CREATE OR REPLACE PROCEDURE generate_relation_salescategory_brand()
LANGUAGE plpgsql
AS $procedure$
DECLARE
	created_timestamp timestamp WITHOUT time zone;
	record_data record;
	cursor_data cursor for
		select 
			distinct
			vmbt.advertiserbrandid,
			rspc.salescategoryid
		from
			view_master_brand_temp vmbt 
			join view_gen21_brand_productcategory vgbp on vgbp.prod_code = vmbt.advertiserbrandid 
			join relation_sales_productgen21_category rspc on rspc.prodg_code = vgbp.prodg_code
			join mt_prodg mp on mp.prodg_code = vgbp.prodg_code 
	;
BEGIN
	created_timestamp := current_timestamp;

	-- delete old data
--	delete from relation_salescategory_brand;
	
	--open cursor
	open cursor_data;
	loop
		fetch cursor_data into record_data;
		exit when not found;
	
		insert into relation_salescategory_brand (
			"salescategoryid",
			"advertiserbrandid",
			"created_by",
			"created_date",
			"is_disabled"
		) values (
			record_data."salescategoryid",
			record_data."advertiserbrandid",
			'{"Id": null, "NIK": null, "FullName": "SYSTEM", "Department_Id": null, "Occupation_Id": 0, "ModuleGroup_Id": 0}',
			created_timestamp,
			false
		);
	end loop;
	close cursor_data;

--	commit;
end;
$procedure$
SET search_path = <schema>
;

--call generate_relation_salescategory_brand();