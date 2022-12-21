insert into master_sales_area(
	salesareaid,
	name,
	description,
	is_disabled
)
select 
	code,
	name,
	descr,
	not active
from 
	dblink(
		'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 
		'
			SELECT 
				code, 
				name,
				descr,
				active
			FROM 
				e_frm."master_salesarea"
		'::text
	) artistype (
		code int, 
		name varchar(50), 
		descr varchar(50), 
		active boolean
	)
;
