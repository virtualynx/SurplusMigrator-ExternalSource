DROP VIEW IF EXISTS view_master_department;

CREATE VIEW view_master_department AS
	SELECT
		os.departmentid,
    	os.name,
    	os.active
   	FROM dblink(
		'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7',
		'
			SELECT 
				structure_code, 
				structure_name, 
				structure_active 
			FROM 
				hris."vOrganization"
		'
	) as os(
		departmentid character varying(50),
		"name" character varying(255),
		active boolean
	)
;