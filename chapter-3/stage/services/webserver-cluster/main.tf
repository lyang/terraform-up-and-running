terraform {
  backend "s3" {}
}

provider "aws" {
  version = "~> 1.7"
  region  = "us-west-2"
}

resource "aws_autoscaling_group" "cluster" {
  launch_configuration = "${aws_launch_configuration.instance.id}"
  availability_zones   = ["${data.aws_availability_zones.all.names}"]
  load_balancers       = ["${aws_elb.elb.name}"]
  health_check_type    = "ELB"
  min_size             = 2
  max_size             = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
