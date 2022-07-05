resource "aws_security_group" "mySG" {
    name            = "allow SSH"
    description     = "Allow SSH from public" 
    ingress {
        description = "allow SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allow outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name        = "SG_for_SSH"
    }
}

output "mySG" {
    value = aws_security_group.mySG.id
}