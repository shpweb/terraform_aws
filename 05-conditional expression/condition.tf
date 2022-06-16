variable "instancetype" {}
variable "istest" {}
variable "az-s" {}

resource "aws_instance" "testec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = var.instancetype
    count = var.istest == true ? 1 : 0
    tags = {
        Name = "test-ec2"
    }
}
resource "aws_instance" "prodec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = var.instancetype
    count = var.istest == false ? 2 : 0
    availability_zone = var.az-s[count.index]
    tags = {
        Name = "prod-ec2-${count.index}"
    }
}