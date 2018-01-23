provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "terraform-states-263131279478"
    key            = "stage/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform_state_locks"
  }
}

resource "aws_autoscaling_group" "cluster" {
  launch_configuration = "${aws_launch_configuration.instance.id}"
  availability_zones   = ["${data.aws_availability_zones.all.names}"]
  load_balancers       = ["${aws_elb.elb.name}"]
  health_check_type    = "ELB"
  min_size             = 1
  max_size             = 3

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
