terraform {
  backend "s3" {
    bucket         = "terraform-states-969834822063"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}

provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
}

module "tfur-cluster" {
  source = "../../../modules/tfur-cluster"
  env    = "dev"
}
