## This will check the depenedency first with null_resource and if fulfilled then only create AWS instance.
/*
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

resource "aws_instance" "myec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = "t2.micro"
    depends_on = [null_resource.healthcheck]
}

resource "null_resource" "healthcheck" {
    provisioner "local-exec" {
        command = "curl https://abcgoogle.com"
    }
}

output "public_ip" {
    value = aws_instance.myec2.public_ip
}
*/