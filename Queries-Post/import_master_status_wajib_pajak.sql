insert into master_status_wajib_pajak (
	statuswajibpajakid,
	name,
	created_date,
	is_disabled
)
values
	(1, 'Perorangan', now(), false),
	(2, 'Perusahaan', now(), false)
;

SELECT setval('master_status_wajib_pajak_statuswajibpajakid_seq', 2, true);
