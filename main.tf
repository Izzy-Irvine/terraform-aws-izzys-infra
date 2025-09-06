terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket                 = "izzy-terraform-state"
    key                    = "terraform.tfstate"
    region                 = "ap-southeast-6"
    skip_region_validation = true
  }
}

provider "aws" {
  region                 = "ap-southeast-6"
  skip_region_validation = true
}

module "backend" {
  source = "./modules/terraform-backend"
}
