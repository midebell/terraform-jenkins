variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "yolu.pem"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-759bc50a"
  }
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
