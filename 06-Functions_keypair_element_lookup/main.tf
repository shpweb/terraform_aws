variable "my_ip" {
    default = "123.201.2.99/32"
}
resource "aws_instance" "myec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = "t2.micro"
    key_name = "webaayu-linux-mumbai"
    security_groups = ["allow_ssh"]
    tags = {
        Name = "sg-keypair-ec2"
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