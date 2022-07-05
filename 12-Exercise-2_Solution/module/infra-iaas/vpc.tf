locals {
    cidr = "10.0.0.0/16"
}

resource "aws_vpc" "ex2-vpc" {
    tags = {
        Name = "${var.name}-vpc"
    }
    cidr_block = local.cidr
}