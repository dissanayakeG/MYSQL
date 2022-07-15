# basic
use rkv6;
select COUNT(name) loca_count, MAX(code) code
from locations
group by tenant_id;

#list all locations
use rkv6;
select COUNT(name) loca_count, GROUP_CONCAT(code) loca_name
from locations
group by tenant_id;

#with relations
#here dont need to use AGG function for tenant_id as groupBy apply on main table
use rkv6;
select COUNT(loc.name) loca_count, GROUP_CONCAT(loc.code) loca_name, loc.tenant_id, St.tena_name
from locations loc
         left join SYS_tenants St on loc.tenant_id = St.tena_id
group by loc.tenant_id
order by loca_name;

#with relations | group by relation column
#here need to use AGG function for tenant_id as groupBy apply on relation table
use rkv6;
select COUNT(loc.name) loca_count, GROUP_CONCAT(loc.code) loca_name, MAX(loc.tenant_id) tenant_id, MAX(St.tena_name) tena_name
from locations loc
         left join SYS_tenants St on loc.tenant_id = St.tena_id
group by St.tena_name
order by St.tena_name;

#advance with searching and limits
use rkv6;
select COUNT(loc.name) loca_count, GROUP_CONCAT(loc.code,'#') loca_name, MAX(loc.tenant_id) tenant_id, MAX(St.tena_name) tena_name
from locations loc
         left join SYS_tenants St on loc.tenant_id = St.tena_id
where tena_name like 'cem' '%'

group by St.tena_name
order by St.tena_name LIMIT 10 OFFSET 0;
