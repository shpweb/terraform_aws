terraform {
    required_providers {
        aws     = {
            source  = "hashicorp/aws"
            version = "~>4.0"
        }
    }

    backend "s3" {
        bucket  = "terraform-state-mumbai"
        key     = "tempstate.tfstate"
        region  = "ap-south-1"
    }
}

provider "aws" {
    region  = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami             = "ami-079b5e5b3971bd10d"
    instance_type   = var.instance_type
    tags            = {
        Name        = var.name
    }
}

resource "aws_iam_user" "lb" {
    name    = "loadbalancer"
    path    = "/system/"
}

variable "instance_type" {
    default = "t2.micro"
}
variable "name" {
    default = "tfstate"
}