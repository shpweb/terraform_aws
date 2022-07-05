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

variable "instancetype" {
    default = "t2.micro"
}
variable "prefix" {
    default = "HPstuff"
}

resource "aws_instance" "myec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = var.instancetype
    key_name = "webaayu-linux-mumbai"
    vpc_security_group_ids = [module.sgmodule.mySG]
    tags = {
        Name = var.prefix
    }
}

module "sgmodule" {
    source  = "../module/sg"
}