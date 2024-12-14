select 
  instance_id,
  instance_type,
  instance_state,
  tags,
  region,
  vpc_id
from 
  aws_ec2_instance
where 
  instance_state = 'running'
order by 
  launch_time desc
limit 5;
