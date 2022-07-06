terraform {
    required_providers {
        aws     = {
            source  = "hashicorp/aws"
            version = "~>4.0"
        }
    }

    backend "s3" {
        bucket  = "terraform-state-mumbai"
        key     = "statelock.tfstate"
        region  = "ap-south-1"
        dynamodb_table = "tfstate-lock"
    }
}

provider "aws" {
    region  = "ap-south-1"
}

resource "time_sleep" "wait_100_seconds" {
   create_duration = "100s"
}