CREATE OR REPLACE FUNCTION fn_getlist_jv_payment_debit_sa(
	vendor_id integer default null, 
	account_id character varying default null, 
	journal_id character varying default null
)
RETURNS TABLE(
	tjournalid character varying,
	tjournal_detailid character varying,
	description character varying,
	bookdate timestamp without time zone,
	duedate timestamp without time zone,
	idramount numeric,
	foreignamount numeric,
	idramountpulled numeric,
	foreignamountpulled numeric,
	idramountoutstanding numeric,
	foreignamountoutstandin numeric,
	foreignrate numeric,
	currencyid integer,
	currencyname character varying,
	accountid character varying,
	accountname text,
	vendorid integer,
	vendorname character varying,
	is_posted boolean,
	ref_id character varying,
	ref_detail_id character varying,
	tjournaldescription character varying,
	sourceid character varying,
	tbudgetid character varying,
	tbudgetname character varying,
	tbudget_detailid character varying
)
LANGUAGE plpgsql
AS $function$
BEGIN 
	create temp table if not exists temp_union as 	
        select 	
            tjd.tjournal_detailid, 	
            tjd.tjournalid, 	
            tjd.foreignamount, 	
            tjd.idramount, tjd.ref_id as sa_id, 	
            tjd.ref_detail_id as sa_detailid 	
        from 	
            transaction_journal_detail tjd 	
            left 	
        join transaction_journal tj on tjd.tjournalid = tj.tjournalid 	
        where 	
            tj.is_disabled = false 	
            and tjd.dk = 'D' 	
            and tjd.foreignamount >= 0 	
            and tjd.idramount >= 0 	
            and ( 	
                   (substring(tjd.tjournalid from 1 for 2) = 'OC' and substring(tjd.ref_id from 1 for 2) = 'SA')  	
                   or (substring(tjd.tjournalid from 1 for 2) = 'OR' and substring(tjd.ref_id from 1 for 2) = 'SA') 	
                   or (substring(tjd.tjournalid from 1 for 2) = 'JV' and substring(tjd.ref_id from 1 for 2) = 'SA') 	
                   or (substring(tjd.tjournalid from 1 for 2) = 'CN' and substring(tjd.ref_id from 1 for 2) = 'SA') 	
                ) 	
        union 	
        select 	
            tjd.tjournal_detailid, 	
            tjd.tjournalid, 	
            tjd.foreignamount, 	
            tjd.idramount, 	
            tjd.tjournalid as sa_id, tjd.tjournal_detailid as sa_detailid 	
        from 	
            transaction_journal_detail tjd 	
            left 	
        join transaction_journal tj on tjd.tjournalid = tj.tjournalid 	
        where 	
            tjd.dk = 'K' 	
            and tjd.foreignamount <= 0 	
            and tjd.idramount <= 0 	
            and tj.is_disabled = false 	
            and  	
               ( 	
                   (substring(tjd.tjournalid from 1 for 2) = 'DN' and substring(tjd.ref_id from 1 for 2) = 'SA') 	
                   or 	
                   (substring(tjd.tjournalid from 1 for 2) = 'JV' and substring(tjd.ref_id from 1 for 2) = 'SA') 	
               ) 	
        union 	
        select 	
            tjd.tjournal_detailid, 	
            tjd.tjournalid, 	
            tjd.foreignamount, 	
            tjd.idramount, 	
            tjd.tjournalid as sa_id, tjd.tjournal_detailid as sa_detailid 	
        from 	
            transaction_journal_detail tjd 	
            left 	
        join transaction_journal tj on tjd.tjournalid = tj.tjournalid 	
        where 	
            tjd.dk = 'K' 	
            and tjd.foreignamount <= 0 	
            and tjd.idramount <= 0 	
            and tj.is_disabled = false 	
            and tj.is_posted = true 	
            and substring(tjd.tjournalid from 1 for 2) = 'SA' 	
        ; 	
 	
	create temp table if not exists temp_outstanding as 	
		select tmp.sa_id as sa_id, tmp.sa_detailid as sa_line, 	
		    sum(tmp.foreignamount) as ForeignAmountOutstanding, sum(tmp.idramount) as IDRAmountOutstanding 	
		    from temp_union tmp 	
		    group by tmp.sa_id, tmp.sa_detailid 	
		; 	
 	
    create temp table if not exists temp_payment as 	
        select 	
            tmp.sa_id as sa_id, 	
            tmp.sa_detailid as sa_line, 	
            sum(tmp.foreignamount) as ForeignAmountOutstanding, 	
            sum(tmp.idramount) as IDRAmountOutstanding 	
        from 	
            temp_union tmp 	
        where 	
            tmp.idramount <= 0 	
            and tmp.foreignamount <= 0 	
        group by 	
            tmp.sa_id, 	
            tmp.sa_detailid 	
        ; 	
 	
    return query
	    select 	
	        tjd.tjournalid, 	
	        tjd.tjournal_detailid, 	
	        tjd.description, 	
	        tj.bookdate, 	
	        tj.duedate, -tjd.idramount as idramount, -tjd.foreignamount as foreignamount, 	
	        (tmpayment.idramountoutstanding) as idramountpulled, 	
	        (tmpayment.foreignamountoutstanding) as foreignamountpulled, 	
	        -tmp.idramountoutstanding as idramountoutstanding, -tmp.foreignamountoutstanding as foreignamountoutstanding, 	
	        tjd.foreignrate, tj.currencyid, 	
	        (select mc.shortname from master_currency mc where mc.currencyid = tjd.currencyid) as currencyname, 	
	        tjd.accountid, 	
	        (select ma.name from master_account ma where ma.accountid = tjd.accountid) as accountname, 	
	        tjd.vendorid, 	
	        (select mv.name from master_vendor mv where mv.vendorid = tjd.vendorid) as vendorname, 	
	        tj.is_posted, 	
	        tjd.ref_id, tjd.ref_detail_id, tj.description as tjournaldescription, tj.sourceid, 	
	        tj.tbudgetid, (select tb.name from transaction_budget tb where tb.tbudgetid = tj.tbudgetid) as tbudgetname, tjd.tbudget_detailid 	
	    from 	
	        transaction_journal_detail tjd 	
	        left join temp_outstanding tmp on tjd.tjournalid = tmp.sa_id and tjd.tjournal_detailid = tmp.sa_line 	
	        left join temp_payment tmpayment on tjd.tjournalid = tmpayment.sa_id and tjd.tjournal_detailid = tmpayment.sa_line 	
	        join transaction_journal tj on tjd.tjournalid = tj.tjournalid 	
	    where 	
	        tj.is_posted = true 	
	        and tj.is_disabled = false 	
	        and substring(tjd.tjournalid from 1 for 2) = 'SA' 	
	        and tmp.foreignamountoutstanding < 0 and tmp.idramountoutstanding < 0 	
	        and (vendor_id IS NULL OR tjd.vendorid = vendor_id)
	        and (account_id IS NULL OR tjd.accountid = account_id)
	        and (journal_id IS NULL OR tjd.tjournalid = journal_id)
		;
end;
$function$
;
