select 
  task_arn,
  region,
  tags
from aws_ecs_task 
where region = 'us-west-2'
  and tags ?& array['Environment', 'Owner', 'CostCenter'];
