-- test_s3_buckets.sql
select 
  name,
  creation_date,
  versioning_enabled,
  server_side_encryption_configuration,
  region
from 
  aws_s3_bucket
order by 
  creation_date desc;
