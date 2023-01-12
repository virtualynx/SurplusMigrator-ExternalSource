CREATE OR REPLACE FUNCTION fn_getList_sa(
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
	foreignamount numeric,
	idramount numeric,
	idramountpulled numeric,
	foreignamountpulled numeric,
	idramountoutstanding numeric,
	foreignamountoutstanding numeric,
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
	departmentid text,
	tbudgetid character varying,
	tjournaldescription character varying,
	sourceid character varying,
	invoiceid character varying,
	tbudgetname character varying,
	tbudget_detailid character varying,
	tbudget_detailname character varying,
	invoicedescription character varying,
	advertiserid character varying,
	advertisername character varying,
	advertiserbrandid character varying,
	brandname character varying,
	accountexecutive_nik character varying,
	accountexecutive_name character varying
)
LANGUAGE plpgsql
AS $function$
BEGIN 
    create temp table if not exists temp_unions2 as 				
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
            and tjd.dk = 'K' 				
            and tjd.foreignamount < 0 				
            and tjd.idramount < 0 				
            and( 				
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
            tjd.ref_id as sa_id, 				
            tjd.ref_detail_id as sa_detailid 				
        from 				
            transaction_journal_detail tjd 				
            left 				
        join transaction_journal tj on tjd.tjournalid = tj.tjournalid 				
        where 				
            tj.is_disabled = false 				
            and tjd.dk = 'D' 				
            and tjd.foreignamount > 0 				
            and tjd.idramount > 0 				
            and( 				
                (substring(tjd.tjournalid from 1 for 2) = 'JV' and substring(tjd.ref_id from 1 for 2) = 'SA') 				
                or (substring(tjd.tjournalid from 1 for 2) = 'DN' and substring(tjd.ref_id from 1 for 2) = 'SA') 				
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
            tjd.dk = 'D' 				
            and tjd.foreignamount > 0 				
            and tjd.idramount > 0 				
            and tj.is_disabled = false 				
            and tj.is_posted = true 				
            and substring(tjd.tjournalid from 1 for 2) = 'SA' 				
        ; 				
				
	create temp table if not exists temp_outstandings as 				
	    select tmp.sa_id as sa_id, tmp.sa_detailid as sa_line, 				
	        sum(tmp.foreignamount) as ForeignAmountOutstanding, sum(tmp.idramount) as IDRAmountOutstanding 				
	        from temp_unions2 tmp 				
	        group by tmp.sa_id, tmp.sa_detailid 				
	    ; 				
	 				
	    create temp table if not exists temp_payments as 				
	        select 				
	            tmp.sa_id as sa_id, 				
	            tmp.sa_detailid as sa_line, 				
	            sum(tmp.foreignamount) as ForeignAmountOutstanding, 				
	            sum(tmp.idramount) as IDRAmountOutstanding 				
	        from 				
	            temp_unions2 tmp 				
	        where 				
	            tmp.idramount < 0 				
	            and tmp.foreignamount < 0 				
	        group by 				
	            tmp.sa_id, 				
	            tmp.sa_detailid 				
	        ; 				
 	
	RETURN query
	    select 				
	        tjd.tjournalid, 				
	        tjd.tjournal_detailid, 				
	        tjd.description, 				
	        tj.bookdate, 				
	        tj.duedate, 				
	        tjd.foreignamount, 				
	        tjd.idramount, 				
	        -(tmpayment.idramountoutstanding) as idramountpulled, 				
	        -(tmpayment.foreignamountoutstanding) as foreignamountpulled, 				
	        tmp.idramountoutstanding as idramountoutstanding, 				
	        tmp.foreignamountoutstanding as foreignamountoutstanding, 				
	        tjd.foreignrate, tj.currencyid, 				
	        (select mc.shortname from master_currency mc where mc.currencyid = tjd.currencyid) as currencyname, 				
	        tjd.accountid, 				
	        (select ma.name from master_account ma where ma.accountid = tjd.accountid) as accountname, 				
	        tjd.vendorid, 				
	        (select mv.name from master_vendor mv where mv.vendorid = tjd.vendorid) as vendorname, 				
	        tj.is_posted, 				
	        tjd.ref_id, tjd.ref_detail_id, tj.departmentid, tjd.tbudgetid, tj.description as tjournaldescription, tj.sourceid, tj.invoiceid,  				
	        (select tb.name from transaction_budget tb where tb.tbudgetid = tjd.tbudgetid) as tbudgetname, 				
	        tjd.tbudget_detailid, (select tbd.descr from transaction_budget_detail tbd where tbd.tbudget_detailid = tjd.tbudget_detailid) as tbudget_detailname,  				
	        tj.invoicedescription, 				
	        tj.advertiserid, (select vma.name from view_master_advertiser vma where vma.advertiserid = tj.advertiserid) as advertisername,  				
	        tj.advertiserbrandid, (select vmb.name from view_master_brand vmb where vmb.advertiserbrandid = tj.advertiserbrandid) as brandname,  				
	        tj.accountexecutive_nik, (select vme.name from view_master_eis vme where vme.nik = tj.accountexecutive_nik) as accountexecutive_name 				
	    from 				
	        transaction_journal_detail tjd 				
	        left join temp_outstandings tmp on tjd.tjournalid = tmp.sa_id and tjd.tjournal_detailid = tmp.sa_line 				
	        left join temp_payments tmpayment on tjd.tjournalid = tmpayment.sa_id and tjd.tjournal_detailid = tmpayment.sa_line 				
	        join transaction_journal tj on tjd.tjournalid = tj.tjournalid 				
	    where 				
	        tj.is_posted = true 				
	        and tmp.idramountoutstanding >= 0 and tmp.foreignamountoutstanding >= 0 				
	        and tj.is_disabled = false 	
	        and (vendor_id IS NULL OR tjd.vendorid = vendor_id)
	        and (account_id IS NULL OR tjd.accountid = account_id)
	        and (journal_id IS NULL OR tjd.tjournalid = journal_id)
		;
end;
$function$
;
