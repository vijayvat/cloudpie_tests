select 
  'EC2 Instance' as title,
  account_id,
  region,
  'aws_ec2_instance' as resource_type
from 
  aws_ec2_instance
union
select 
  'EC2 Volume' as title,
  account_id,
  region,
  'aws_ebs_volume' as resource_type
from 
  aws_ebs_volume
union
select 
  'EC2 Snapshot' as title,
  account_id,
  region,
  'aws_ebs_snapshot' as resource_type
from 
  aws_ebs_snapshot
union
select 
  'EC2 Security Group' as title,
  account_id,
  region,
  'aws_vpc_security_group' as resource_type
from 
  aws_vpc_security_group
limit 10;
