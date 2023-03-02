CREATE OR REPLACE FUNCTION get_changeuser(group_ref character varying)
RETURNS character varying
LANGUAGE plpgsql
AS $function$
	declare jurnal_id varchar(50);
begin
	select distinct tjournalid into jurnal_id
	from transaction_journal_detail
	where journalreferencetypeid = 'change_user' and ref_id = group_ref and is_disabled = false;
	
	if jurnal_id <> '' or jurnal_id is not null then 
		return get_changeuser(jurnal_id);
	else 
		return group_ref;
	end if;
end
$function$
;
