insert into master_artist_profession (
	artistprofessionid,
	name,
	remark,
	is_disabled
)
select 
	code,
	name,
	note,
	not active
from 
	dblink(
		'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 
		'
			SELECT 
				code,
				name, 
				note,
				active
			FROM 
				e_frm."master_skill"
		'::text
	) tbl (
		code int,
		name varchar(100), 
		note varchar(200), 
		active bool
	)
;

ALTER SEQUENCE 
	master_artist_profession_artistprofessionid_seq 
RESTART WITH (
	select max(artistprofessionid) from master_artist_profession
);