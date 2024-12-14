select 
  title,
  account_id,
  region,
  resource_type
from 
  aws_all_resources
where 
  resource_type like 'aws_ec2%'
limit 10;
