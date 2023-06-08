CREATE OR REPLACE PROCEDURE gen21_view_refresh()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
	-- >> posttx dependencies
	Raise Notice 'refresh mg_channel ...';
	refresh materialized view mg_channel;
	Raise Notice 'refresh mp_film ...';
	refresh materialized view mp_film;
	Raise Notice 'refresh mt_agen ...';
	refresh materialized view mt_agen;
	Raise Notice 'refresh mt_client ...';
	refresh materialized view mt_client;
	Raise Notice 'refresh mt_prod ...';
	refresh materialized view mt_prod;
	Raise Notice 'refresh mt_prod1 ...';
	refresh materialized view mt_prod1; -- 4sec
	Raise Notice 'refresh mt_salesman ...';
	refresh materialized view mt_salesman;
--	Raise Notice 'refresh pur_episode_hdr ...';
--	refresh materialized view concurrently pur_episode_hdr; -- 2min
	Raise Notice 'refresh purchase_contract_hdr ...';
	refresh materialized view purchase_contract_hdr;
	Raise Notice 'refresh st_pkg_int_hdr ...';
	refresh materialized view st_pkg_int_hdr;
	Raise Notice 'refresh st_reservation_matrix1 ...';
	refresh materialized view st_reservation_matrix1; -- 12sec
	Raise Notice 'refresh st_reservations ...';
	refresh materialized view st_reservations;
	Raise Notice 'refresh tp_adnl_epi_plan ...';
	refresh materialized view tp_adnl_epi_plan;
	Raise Notice 'refresh tp_cbs_dps1 ...';
	refresh materialized view tp_cbs_dps1;
--	Raise Notice 'refresh tt_mo1 ...';
--	refresh materialized view concurrently tt_mo1; -- 30-40min
--	Raise Notice 'refresh tt_mo2 ...';
--	refresh materialized view concurrently tt_mo2; -- 80sec
	Raise Notice 'refresh posttx_episodes ...';
	refresh materialized view concurrently posttx_episodes; -- 13sec
	Raise Notice 'refresh posttx_prod_versions ...';
	refresh materialized view posttx_prod_versions; -- 4sec
	-- >> end of posttx dependencies

	Raise Notice 'refresh purchase_contract_dtl ...';
	refresh materialized view purchase_contract_dtl;

	Raise Notice 'refresh view_airedprograms ...';
	refresh materialized view view_airedprograms;

	Raise Notice 'refresh mp_sch_planner ...';
	refresh materialized view mp_sch_planner;

	Raise Notice 'refresh mp_adnl_epi_plan ...';
	refresh materialized view mp_adnl_epi_plan;
end;
$procedure$
SET search_path = <schema>
;
