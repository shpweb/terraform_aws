terraform {
    backend "s3" {
        bucket  = "terraform-state-mumbai"
        key     = "security-project/sg.tfstate"
        region  = "ap-south-1"
    }
}
