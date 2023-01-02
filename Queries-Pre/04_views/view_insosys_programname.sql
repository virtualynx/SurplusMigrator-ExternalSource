DROP VIEW IF EXISTS view_insosys_programname;

CREATE VIEW view_insosys_programname as
	select
		show_id as "showid",
		show_title as "name"
	from
		dblink(
			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7 ',
            'SELECT show_id, show_title FROM e_frm.master_show'
		) as tbl (
			show_id varchar(15),
            show_title varchar(50)
        )
;
