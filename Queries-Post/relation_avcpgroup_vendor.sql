insert into relation_avcpgroup_vendor (avcpgroupid, vendorid, created_date, is_disabled)
select 
	d.avcpgroupid, d.vendorid, d.created_date, d.is_disabled
from (
		select 1 as avcpgroupid, 9680 as vendorid, now() as created_date, false as is_disabled
		union all
		select 1, 814, now(), false
		union all
		select 1, 13541, now(), false
		union all
		select 1, 271, now(), false
		union all
		select 1, 13546, now(), false
		union all
		select 1, 13788, now(), false
		union all
		select 1, 312, now(), false
		union all
		select 2, 11064, now(), false
		union all
		select 2, 8142, now(), false
		union all
		select 3, 8945, now(), false
		union all
		select 3, 1374, now(), false
		union all
		select 4, 6916, now(), false
		union all
		select 4, 616, now(), false
		union all
		select 4, 6005, now(), false
		union all
		select 4, 2876, now(), false
		union all
		select 5, 4775, now(), false
		union all
		select 5, 477, now(), false
		union all
		select 5, 1887, now(), false
		union all
		select 6, 470, now(), false
		union all
		select 6, 4771, now(), false
	) as d
WHERE
	NOT EXISTS (
		SELECT avcpgroupid FROM relation_avcpgroup_vendor
	)
;