resource "aws_instance" "myec2" {
    ami = "ami-079b5e5b3971bd10d"
    instance_type = "t2.micro"
    key_name = "webaayu-linux-mumbai"
    tags = {
        Name = "local-ec2"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt &&  echo ${aws_instance.myec2.public_ip} >> public_ips.txt"
    }
}
