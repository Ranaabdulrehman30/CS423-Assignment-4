resource "aws_vpc" "devops-ass-4" {
 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "devops-assignemt-4"
 }
}
variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}



variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b"]
}


variable "private_key" {
  type        = string
  description = "File path of private key."
  default     = "/home/rana/.ssh/id_rsa"
}


variable "ami" {
  default = {
    "us-east-1" = "ami-04169656fea786776"
    "us-west-1" = "ami-006fce2a9625b177f"
  }
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}

