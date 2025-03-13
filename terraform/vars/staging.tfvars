project_name = "datascientest-exam"

environment = "staging"

aws_main_region = "eu-west-3"
availability_zone_1 = "eu-west-3a"
availability_zone_2 = "eu-west-3b"

vpc_cidr = "10.10.0.0/16"
private_zone_1_cidr = "10.10.1.0/24"
private_zone_2_cidr = "10.10.2.0/24"
private_zone_1_rds_cidr = "10.10.3.0/24"
private_zone_2_rds_cidr = "10.10.4.0/24"
public_zone_1_cidr = "10.10.5.0/24"
public_zone_2_cidr = "10.10.6.0/24"

eks_version = "1.28"