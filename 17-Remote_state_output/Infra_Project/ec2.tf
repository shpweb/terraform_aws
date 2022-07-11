resource "aws_instance" "myec2" {
    ami             = "ami-079b5e5b3971bd10d"
    instance_type   = "t2.micro"
    tags            = {
        Name        = "remote-state"
    }
}

output "public_ip" {
    value = "${aws_instance.myec2.public_ip}"
}