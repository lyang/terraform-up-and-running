resource "aws_launch_configuration" "tfur-web-lc" {
  name            = "tfur-${var.env}-web-lc"
  image_id        = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.tfur-web-sg.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, ${var.env}" > index.html
              nohup busybox httpd -f -p "${var.web-port}" &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
