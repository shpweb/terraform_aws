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
}

provider "aws" {
    region  = "us-east-1"
    alias   = "us"
}
