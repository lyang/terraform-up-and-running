resource "aws_autoscaling_group" "tfur-web-asg" {
  name                 = "tfur-${var.env}-web-asg"
  launch_configuration = "${aws_launch_configuration.tfur-web-lc.id}"
  availability_zones   = ["${data.aws_availability_zones.all.names}"]
  load_balancers       = ["${aws_elb.tfur-web-elb.name}"]
  health_check_type    = "ELB"
  min_size             = 1
  max_size             = 3

  tag {
    key                 = "Name"
    value               = "tfur-${var.env}-web-asg"
    propagate_at_launch = true
  }
}
