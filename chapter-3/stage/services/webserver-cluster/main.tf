provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "terraform-states-969834822063"
    key            = "stage/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}

resource "aws_autoscaling_group" "tfur-stage-web-asg" {
  name                 = "tfur-stage-web-asg"
  launch_configuration = "${aws_launch_configuration.tfur-stage-web-lc.id}"
  availability_zones   = ["${data.aws_availability_zones.all.names}"]
  load_balancers       = ["${aws_elb.tfur-stage-web-elb.name}"]
  health_check_type    = "ELB"
  min_size             = 1
  max_size             = 3

  tag {
    key                 = "Name"
    value               = "tfur-stage-web-asg"
    propagate_at_launch = true
  }
}
