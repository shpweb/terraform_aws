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

resource "aws_instance" "projA" {
    ami             = "ami-079b5e5b3971bd10d"
    instance_type   = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
    default = {
        default = "t2.nano"
        dev     = "t2.micro"
        prd     = "t2.large"
    }
}

output "instancetype" {
    value = "${aws_instance.projA.instance_type}"
}