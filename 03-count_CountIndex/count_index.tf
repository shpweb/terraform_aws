terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.0"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = "t2.micro"
    count = 3
    tags = {
        name = "myec2-${count.index}"
    }
}

resource "aws_iam_user" "for_lb" {
    name = var.iam_lb[count.index]
    count = 3
    path = "/system/"
}

output "instance_name_id" {
    value = aws_instance.myec2
}

output "iam_user" {
    value = aws_iam_user.for_lb
}