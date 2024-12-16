select 
  task_arn,
  region,
  last_status,
  desired_status,
  tags,
  created_at
from aws_ecs_task 
where launch_type = 'FARGATE'
  and region = 'us-west-2'
  and not tags ?& array['Environment', 'Owner', 'CostCenter'];
