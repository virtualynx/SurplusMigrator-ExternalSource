DROP MATERIALIZED VIEW IF EXISTS view_master_eis CASCADE;

CREATE MATERIALIZED VIEW view_master_eis AS
	SELECT 
		nik,
    	"name",
	    unit,
	    "position",
	    "management_level",
	    position_id,
	    department_id,
	    division_id,
	    directorate_id,
	    phone,
	    npwp,
	    birth_date,
	    birth_place,
		ktp_number,
		ktp_address,
		address,
		last_education,
		bankaccount_number,
		bankaccount_name,
		phk_date,
		phk_code
	FROM dblink(
		'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 
		'
			SELECT 
				"NIK" as nik, 
				"Nama" as "name",
				"Unit" as unit,
				"Jabatan" as position,
				"ManajemenLevel" as management_level,
				"KodePosisi" as position_id,
				"department_code",
				"division_code",
				"directorate_code",
				"NomorHP",
				"NPWP",
				"TanggalLahir",
				"TempatLahir",
				"NoKTP",
				"AlamatKTP",
				"Alamat",
				"Pendidikan",
				"rekening_no",
				"rekening_nama",
				"TanggalPHK",
				"KodePHK"
			FROM 
				hris."MasterEis"'::text
	) tbl (
		nik character varying(10), 
		name character varying(100), 
		unit character varying(255), 
		"position" character varying(100), 
		"management_level" character varying(30),
		position_id character varying(50),
		department_id character varying(50),
		division_id character varying(50),
		directorate_id character varying(50),
		phone character varying(25),
		npwp character varying(50),
		birth_date date,
		birth_place character varying(25),
		ktp_number character varying(40),
		ktp_address character varying(100),
		address character varying(100),
		last_education character varying(100),
		bankaccount_number character varying(50),
		bankaccount_name character varying(50),
		phk_date date,
		phk_code int
	)
WITH DATA;

DROP VIEW IF EXISTS view_master_eis_active;

CREATE VIEW view_master_eis_active AS
	SELECT 
		*
	FROM 
		view_master_eis
	where 
		(phk_date IS NULL) 
		AND (phk_code IS NULL) 
		OR (phk_date > (current_date - INTERVAL '1 day')::date)
;