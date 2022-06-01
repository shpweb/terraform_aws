provider "aws" {}

resource "aws_instance" "first_ec2_with_terraform" {
	ami = "ami-079b5e5b3971bd10d"
	instance_type = "t2.micro"
	tags = {
		Name = "ec2_by_tf"
	}
}



