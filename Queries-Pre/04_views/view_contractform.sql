DROP VIEW IF EXISTS view_contractform;

CREATE VIEW view_contractform AS 
	SELECT 
		contractformid,
		"type_id",
		"type",
		code,
		artist_id,
		artist_name,
		program_name,
		job,
		start_date,
		end_date,
		total_episode,
		remuneration,
		created_by,
		contractform_isapproved as "is_approved",
		contractform_isapprovedlegal as "is_approved_legal",
		contractform_isregent as is_regent,
		contractform_dealprice as dealprice,
		worktype_id,
		worktype_name,
		contractform_bank_accountnumber as bankacc_number
	FROM 
		dblink(
			'dbname=integration port=5432 host=172.16.123.121 user=postgres password=initrans7'::text, 
			'
				SELECT 
					contractform_id, 
					type.contracttype_id,
					type.contracttype_name,
					trim(contractform_code),
					contractform_artist_code,
					contractform_artist_name,
					show_name,
					worktype_name,
					contractform_shooting_startdate,
					contractform_shooting_enddate,
					contractform_episode_total,
					contractform_totalprice,
					created_by,
					contractform_isapproved,
					contractform_isapprovedlegal,
					contractform_isregent,
					contractform_dealprice,
					worktype.worktype_id,
					worktype.worktype_name,
					contractform_bank_accountnumber
				FROM 
					e_legal.transaction_contractform tcontract
					left join e_legal.master_worktype worktype on tcontract.worktype_id = worktype.worktype_id
					left join e_legal.master_contracttype type on tcontract.contracttype_id = type.contracttype_id
			'::text
		) tbl(
			contractformid varchar(50),
			"type_id" int4,
			"type" varchar(25),
			code varchar(50),
			artist_id varchar(50),
			artist_name varchar(500),
			program_name varchar(255),
			job varchar(255),
			start_date timestamp,
			end_date timestamp,
			total_episode int4,
			remuneration numeric,
			created_by varchar(255),
			contractform_isapproved bool,
			contractform_isapprovedlegal bool,
			contractform_isregent bool,
			contractform_dealprice numeric,
			worktype_id int,
			worktype_name varchar(255),
			contractform_bank_accountnumber varchar(100)
		)
;

