select 
  case 
    when count(*) = 0 then 
      (select 1/0)
    else 
      count(*)
  end as non_compliant_count
from aws_ecs_task 
where launch_type = 'FARGATE'
  and region = 'us-west-2'
  and not tags ?& array['Environment', 'Owner', 'CostCenter'];
