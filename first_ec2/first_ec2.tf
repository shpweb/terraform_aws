provider "aws" {
	region = "ap-south-1"
	access_key = "AKIAZC7OIMZENLG2YYHR"
	secret_key = "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"
}

resource "aws_instance" "first_ec2_with_terraform" {
	ami = "ami-079b5e5b3971bd10d"
	instance_type = "t2.micro"
	tags = {
		Name = "ec2_by_tf"
	}
}



