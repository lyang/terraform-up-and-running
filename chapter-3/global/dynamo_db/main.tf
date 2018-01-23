provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
}

resource "aws_dynamodb_table" "terraform_state_locks" {
  name           = "terraform_state_locks"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
