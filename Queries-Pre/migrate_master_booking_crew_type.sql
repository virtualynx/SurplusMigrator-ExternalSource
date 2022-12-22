insert into master_booking_crew_type(
	bookingcrewtypeid,
	name,
	preparationday,
	created_date,
	is_disabled
)
select 
	crewequipment_type_id,
	crewequipment_type,
	crewequipment_type_days,
	current_date,
	false
from 
	dblink(
		'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7', 
		'
			SELECT 
				crewequipment_type_id, 
				crewequipment_type,
				crewequipment_type_days
			FROM 
				e_frm."master_crewequipmenttype"
		'
	) tbl (
		crewequipment_type_id int, 
		crewequipment_type varchar(50), 
		crewequipment_type_days int
	)
;