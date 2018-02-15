provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
  profile = "personal-staging"
}

terraform {
  backend "s3" {
    bucket         = "terraform-states-969834822063"
    key            = "stage/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}

module "tfur-cluster" {
  source = "../../../modules/tfur-cluster"
  env    = "stage"
}
