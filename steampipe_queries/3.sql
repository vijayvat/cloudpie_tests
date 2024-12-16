with task_check as (
  select count(*) as total_tasks 
  from aws_ecs_task
  where launch_type = 'FARGATE'
),
compliance_check as (
  select 
    task_arn,
    task_definition_arn,
    cluster_arn,
    tags,
    created_at
  from aws_ecs_task
  where launch_type = 'FARGATE'
    and not tags ?& array['Environment', 'Owner', 'CostCenter']
)
select 
  case 
    when (select total_tasks from task_check) = 0 
    then 'WARNING: No Fargate tasks found to check'
    else task_arn || ' is missing required tags'
  end as finding,
  task_definition_arn,
  cluster_arn,
  tags,
  created_at
from compliance_check;
