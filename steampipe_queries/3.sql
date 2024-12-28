SELECT public_ip, allocation_id, tags FROM aws_vpc_eip WHERE association_id IS NULL;
