resource "aws_instance" "ec2mumbai-front" {
    ami = var.ami-mumbai
    instance_type = var.instancetype
    count = 2
    availability_zone = var.az-s[count.index]
    depends_on = [aws_instance.ec2mumbai-backend]
    lifecycle {
        create_before_destroy = true
    }
    tags = {
        Name = "front-${count.index}"
    }
}

resource "aws_instance" "ec2singapore-front" {
    ami = var.ami-singapore
    instance_type = var.instancetype
    count = 2
    availability_zone = var.az-se[count.index]
    provider = aws.singapore
    depends_on = [aws_instance.ec2singapore-backend]
    lifecycle {
        create_before_destroy = true
    }
    tags = {
        Name = "front-${count.index}"
    }
    
}
resource "aws_instance" "ec2mumbai-backend" {
    ami = var.ami-mumbai
    instance_type = var.instancetype
    count = 2
    availability_zone = var.az-s[count.index]
    lifecycle {
        prevent_destroy = true
    }
    tags = {
        Name = "backend-${count.index}"
    }
}

resource "aws_instance" "ec2singapore-backend" {
    ami = var.ami-singapore
    instance_type = var.instancetype
    count = 2
    availability_zone = var.az-se[count.index]
    provider = aws.singapore
    lifecycle {
        prevent_destroy = true
    }
    tags = {
        Name = "backend-${count.index}"
    }
}

output "mumbai-front-PublicIP" {
    value = aws_instance.ec2mumbai-front.*.public_ip
}
output "mumbai-backend-PublicIP" {
    value = aws_instance.ec2mumbai-backend.*.public_ip
}