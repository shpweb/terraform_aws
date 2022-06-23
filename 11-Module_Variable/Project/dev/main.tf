terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.0"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}

module "ec2module" {
    source = "../../Module/EC2"
    instancetype = "t2.small"
}