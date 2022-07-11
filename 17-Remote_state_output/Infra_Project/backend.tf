terraform {
    backend "s3" {
        bucket  = "terraform-state-mumbai"
        key     = "infra-project/ec2.tfstate"
        region  = "ap-south-1"
    }
}
