insert into "AspNetUsers"(
	id,
	nik,
	fullname,
	username,
	departmentid,
	isdisabled,
	occupationid,
	usergroupid,
	emailconfirmed,
	phonenumberconfirmed,
	twofactorenabled,
	lockoutenabled,
	accessfailedcount,
	email,
	phonenumber
)
select 
	uuid_generate_v4(),
	master_eis.nik, 
	master_eis."name", 
	master_eis."name", 
	case when coalesce(TRIM(master_eis.department_code), '') <> '' then 
		master_eis.department_code
	else
		case when coalesce(TRIM(master_eis.division_code), '') <> '' then 
			master_eis.division_code
		else
			master_eis.directorate_code
		end
	end,
	false,
	1,
	1,
	false,
	false,
	false,
	false,
	0,
	master_eis.email, 
	master_eis.phone
from 
	dblink(
		'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 
		'
			SELECT 
				"NIK" as nik, 
				"Nama" as name,
				department_code,
				division_code,
				directorate_code,
				email,
				"NomorHP" as phone
			FROM 
				hris."MasterEisAktif"
		'::text
	) master_eis (
		nik character varying(10), 
		"name" character varying(100), 
		department_code character varying(50), 
		division_code character varying(50), 
		directorate_code character varying(50), 
		email character varying(200), 
		phone character varying(25)
	)
;