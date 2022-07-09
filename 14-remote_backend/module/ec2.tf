resource "aws_instance" "myec2" {
    ami             = "ami-079b5e5b3971bd10d"
    instance_type   = var.instance_type
    tags            = {
        Name        = var.name
    }
}

variable "instance_type" {
    default = "t2.nano"
}
variable "name" {
    default = "ec2-01"
}