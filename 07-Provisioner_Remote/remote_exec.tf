resource "aws_instance" "webserver" {
  ami             = "ami-079b5e5b3971bd10d"
  instance_type   = "t2.micro"
  key_name        = "webaayu-linux-mumbai"
  security_groups = ["webSG"]
  tags = {
    Name = "web-remote-exec"
  }
  connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("/Users/hardik.patel/Downloads/webaayu-linux-mumbai.pem")
        host = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [
            "sudo amazon-linux-extras install -y nginx1",
            "sudo systemctl start nginx"
        ]
    }
}

output "web_public_ip" {
    value = aws_instance.webserver.public_ip
}

resource "aws_security_group" "webSG" {
    name = "webSG"
    description = "Allow  Web traffic from public"
    ingress {
        description = "allow http port"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow SSH port"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allow internet outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Allow_web"
    }
}