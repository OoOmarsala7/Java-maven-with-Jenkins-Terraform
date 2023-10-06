provider "aws" {
  region = "eu-central-1"

}
variable "cidr_blocks" {
    type = list(object({
      cidr_block = string
      name = string
    }))
  
}


resource "aws_vpc" "devleopment_vpc" {
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
      Name: "new"
      env: var.cidr_blocks[0].name 
    }
  }
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.devleopment_vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "eu-central-1a"
    tags = {
      "Name" = "slahf"
      "env" = var.cidr_blocks[1].name
    }
}
data "aws_vpc" "existing_VPC" {
    default = true
  
}

resource "aws_subnet" "myprivate_sub" {
    vpc_id = data.aws_vpc.existing_VPC.id
    cidr_block = var.cidr_blocks[1].cidr_block

    tags = {
      "Name" = "slhf"
      "env" = var.cidr_blocks[1].name
    }
}
output "VPC_ID" {
    value = aws_vpc.devleopment_vpc.id

}
output "SUB_ID" {
  value = aws_subnet.dev-subnet-1.id
}
    
