# Private subnet for EKS in AZ 1
resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_zone_1_cidr
  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.environment}-private-${var.availability_zone_1}"

    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "owned"
  }
}

# Private subnet for EKS in AZ 2
resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_zone_2_cidr
  availability_zone = var.availability_zone_2

  tags = {
    Name                                                   = "${var.environment}-private-${var.availability_zone_2}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "owned"
  }
}

# Private subnet for RDS in AZ 1
resource "aws_subnet" "private_zone_rds_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_zone_1_rds_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.environment}-private-rds-${var.availability_zone_1}"
    Service = "RDS"
  }
}

# Private subnet for RDS in AZ 2
resource "aws_subnet" "private_zone_rds_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_zone_2_rds_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.environment}-private-rds-${var.availability_zone_2}"
    Service = "RDS"
  }
}

# Public subnet for EKS in AZ 1
resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_zone_1_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name                                                   = "${var.environment}-public-${var.availability_zone_1}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "owned"
  }
}

# Public subnet for EKS in AZ 2
resource "aws_subnet" "public_zone2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_zone_2_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name                                                   = "${var.environment}-public-${var.availability_zone_2}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "owned"
  }
}