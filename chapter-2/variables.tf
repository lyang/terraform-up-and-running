variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "web-port" {
  description = "The port the server will use for HTTP requests"
  default     = "8080"
}
