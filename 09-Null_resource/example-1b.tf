## This will provision the instance but in tainted state as local exec depenedency failed. which is overcome by null_resource in previous example-2.
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
    provisioner "local-exec" {
        command = "curl https://abcgoogle.com"
}
output "public_ip" {
    value = aws_instance.myec2.public_ip
}
*/