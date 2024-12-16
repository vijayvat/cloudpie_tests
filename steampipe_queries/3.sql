with task_inventory as (
  select 
    count(*) as total_tasks,
    region
  from aws_ecs_task
  where launch_type = 'FARGATE'
  group by region
),
task_details as (
  select 
    task_arn,
    task_definition_arn,
    cluster_arn,
    last_status,
    desired_status,
    platform_version,
    region,
    tags,
    created_at,
    capacity_provider_name,
    connectivity,
    case
      when not tags ?& array['Environment', 'Owner', 'CostCenter'] then 'Missing required tags'
      when last_status != desired_status then 'Task status mismatch'
      when last_status = 'STOPPED' then 'Task stopped'
      when platform_version != 'LATEST' then 'Not on latest platform version'
      when connectivity != 'CONNECTED' then 'Connectivity issues'
      else 'Compliant'
    end as compliance_status
  from aws_ecs_task
  where launch_type = 'FARGATE'
),
compliance_summary as (
  select
    td.region,
    td.task_arn,
    td.cluster_arn,
    td.compliance_status,
    td.last_status,
    td.platform_version,
    td.tags,
    td.created_at,
    ti.total_tasks as tasks_in_region
  from task_details td
  left join task_inventory ti on td.region = ti.region
  where td.compliance_status != 'Compliant'
)
select
  case 
    when (select count(*) from task_inventory) = 0 
      then raise_error('CRITICAL: No Fargate tasks found in any region')
    when (select count(*) from compliance_summary) = 0 
      then 'OK: All Fargate tasks are compliant'
    else 'VIOLATION: Non-compliant Fargate tasks found'
  end as overall_status,
  region,
  task_arn,
  compliance_status,
  last_status,
  platform_version,
  tags,
  created_at,
  tasks_in_region || ' total tasks in region' as region_context
from compliance_summary
order by 
  case compliance_status
    when 'Missing required tags' then 1
    when 'Task status mismatch' then 2
    when 'Task stopped' then 3
    when 'Not on latest platform version' then 4
    when 'Connectivity issues' then 5
    else 6
  end,
  region;
