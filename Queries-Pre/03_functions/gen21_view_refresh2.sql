CREATE OR REPLACE PROCEDURE gen21_view_refresh2()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
	-- >> posttx dependencies
	Raise Notice 'refresh pur_episode_hdr ...';
	refresh materialized view concurrently pur_episode_hdr; -- 2min
	Raise Notice 'refresh tt_mo1 ...';
	refresh materialized view concurrently tt_mo1; -- 4min
	Raise Notice 'refresh tt_mo2 ...';
	refresh materialized view concurrently tt_mo2; -- 80sec
	-- >> end of posttx dependencies
	Raise Notice 'refresh view_updateposttx ...';
	refresh materialized view concurrently view_updateposttx; -- 3min
end;
$procedure$
SET search_path = <schema>
;
