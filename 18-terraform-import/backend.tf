terraform {
    backend "s3" {
        bucket  = "terraform-state-mumbai"
        key     = "tfimport/ec2.tfstate"
        region  = "ap-south-1"
    }
}
