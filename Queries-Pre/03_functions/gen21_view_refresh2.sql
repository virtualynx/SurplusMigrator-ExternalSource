CREATE OR REPLACE PROCEDURE gen21_view_refresh2()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
	-- >> posttx dependencies
	Raise Notice 'refresh pur_episode_hdr ...';
	refresh materialized view concurrently pur_episode_hdr; -- 2min
	Raise Notice 'refresh tt_mo1 ...';
	refresh materialized view concurrently tt_mo1; -- 30-40min
	Raise Notice 'refresh tt_mo2 ...';
	refresh materialized view concurrently tt_mo2; -- 80sec
	-- >> end of posttx dependencies
end;
$procedure$
SET search_path = <schema>
;
