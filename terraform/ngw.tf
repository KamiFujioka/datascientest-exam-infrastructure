# Nat gateway pour traduire les IPs des VMs privés en IP public et fournir un accès internet au subnets privés
resource "aws_eip" "ngw" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-${var.environment}-ngw"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public_zone1.id

  tags = {
    Name = "${var.project_name}-${var.environment}-ngw"
  }

  depends_on = [aws_internet_gateway.igw]
}