select 
  task_arn,
  region,
  tags
from aws_ecs_task 
where launch_type = 'FARGATE'
  and region = 'us-west-2'
  and tags ?& array['Environment', 'Owner', 'CostCenter'];
