data "terraform_remote_state" "publicip" {
  backend = "s3"
  config = {
    bucket  = "terraform-state-mumbai"
    key     = "infra-project/ec2.tfstate"
    region  = "ap-south-1"
  }
}