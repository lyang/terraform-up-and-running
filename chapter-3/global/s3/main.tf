provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "terraform-states" {
  bucket = "terraform-states-${data.aws_caller_identity.current.account_id}"
  acl    = "private"

  versioning {
    enabled = true
  }
}
