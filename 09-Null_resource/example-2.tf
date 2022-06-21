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
    count = 0
}

resource "null_resource" "ip_check" {
    triggers = {
        latest_ips = join(",",aws_instance.myec2[*].public_ip)
    }    
    
    provisioner "local-exec" {
        command = "echo Latest IPs are ${null_resource.ip_check.triggers.latest_ips} > sample.txt"
    }
}
