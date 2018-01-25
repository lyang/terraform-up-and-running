resource "aws_security_group" "tfur-web-elb-sg" {
  name = "tfur-${var.env}-web-elb-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tfur-web-sg" {
  name = "tfur-${var.env}-web-sg"

  ingress {
    from_port   = "${var.web-port}"
    to_port     = "${var.web-port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
