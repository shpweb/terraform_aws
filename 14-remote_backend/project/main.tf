terraform {
    required_providers {
        aws     = {
            source  = "hashicorp/aws"
        }
    }

    backend "s3" {
        bucket  = "terraform-state-mumbai"
        key     = "ec2.tfstate"
        region  = "ap-south-1"
    }
}

provider "aws" {
    region  = "ap-south-1"
}

module "ec2" {
    source = "../module/"
    instance_type = "t2.micro"
    name    = "backend-test"
}