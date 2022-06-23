resource "aws_instance" "myec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = var.instancetype
    security_groups = ["default"]
}

# Variables can be defined in separate file variables.tf as well.

variable "instancetype" {
    default = "t2.micro"
}