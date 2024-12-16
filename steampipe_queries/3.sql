select 
  case 
    when count(*) = 0 then 
      -- All tasks have required tags, so make query fail
      (select 1/0)  -- This forces error/non-zero exit
    else 
      count(*) -- Return count of non-compliant tasks
  end as non_compliant_count
from aws_ecs_task 
where launch_type = 'FARGATE'
  and region = 'us-west-2'
  and not tags ?& array['Environment', 'Owner', 'CostCenter'];
