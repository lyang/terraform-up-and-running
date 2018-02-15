resource "aws_launch_configuration" "tfur-web-lc" {
  name_prefix     = "tfur-${var.env}-web-lc-"
  image_id        = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.tfur-web-sg.id}"]

  user_data = "${data.template_file.user_data.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}
