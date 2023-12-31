resource "aws_subnet" "devops-public_subnets" {
 count             = length(var.public_subnet_cidrs)
 vpc_id            = aws_vpc.devops-ass-4.id
 cidr_block        = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "devop-Public Subnet ${count.index + 1}"
 }
}
 
resource "aws_subnet" "devops-private_subnets" {
 count             = length(var.private_subnet_cidrs)
 vpc_id            = aws_vpc.devops-ass-4.id
 cidr_block        = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "devops-Private Subnet ${count.index + 1}"
 }
}

resource "aws_internet_gateway" "devops-gw" {
 vpc_id = aws_vpc.devops-ass-4.id
 
 tags = {
   Name = "Project VPC IG"
 }
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.devops-ass-4.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.devops-gw.id
 }
 
 tags = {
   Name = "2nd Route Table"
 }
}
resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.devops-public_subnets[*].id, count.index)
 route_table_id = aws_route_table.second_rt.id
}
