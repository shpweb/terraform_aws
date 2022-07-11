terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.0"
        }
    }
}

provider "aws" {
    region  = "ap-south-1"
    assume_role {
        role_arn     = "arn:aws:iam::436814709537:role/webaayu-outlook"
        session_name = "vipweb"
    }
}
