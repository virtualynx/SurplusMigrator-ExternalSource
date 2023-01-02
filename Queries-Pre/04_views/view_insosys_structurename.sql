DROP VIEW IF EXISTS view_insosys_structurename;

CREATE VIEW view_insosys_structurename as
	select
		strukturunit_id as "structureunitid",
		strukturunit_name as "name"
	from
		dblink(
			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ',
            'SELECT strukturunit_id, strukturunit_name FROM e_frm.master_strukturunit'
		) as tbl (
			strukturunit_id varchar(10),
            strukturunit_name varchar(50)
        )
;
