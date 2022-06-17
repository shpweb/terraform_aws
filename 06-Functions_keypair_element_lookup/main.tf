locals {
    time = formatdate("DD MMM YYYY hh:mm ZZZ",timestamp())
}
resource "aws_instance" "myec2" {
    ami = lookup(var.ami,var.region)
    instance_type = "t2.micro"
    key_name = "webaayu-linux-mumbai"
    security_groups = ["allow_ssh"]
    count = 2
    availability_zone = var.az-s[count.index]
    tags = {
        Name = element(var.nametag,count.index)
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH from the Public IP at Home"
    ingress {
        description = "allow ssh from Hardik home"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }
    tags = {
        Name = "Allow_SSH"
    }
}

output "timestamp" {
    value = local.time
}