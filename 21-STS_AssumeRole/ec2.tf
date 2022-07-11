resource "aws_instance" "myec2" {
    ami             = "ami-08df646e18b182346"
    instance_type   = "t2.micro" 
    tags    =   {
        Name    = "myec2-tf"
    }
}