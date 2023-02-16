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

insert into master_sales_area(
	salesareaid,
	name,
	description,
	is_disabled
) VALUES (
	0,
	'Unknown',
	'To satisfy null reference on transaction_sales_order migrated data',
	false
);
