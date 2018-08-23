resource "aws_instance" "ctproject" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "subnet-20d6052f"

  # the security group
  vpc_security_group_ids = ["sg-cc2ea784"]

  # the public SSH key
  key_name = "yolu"

 tags {
        Name = "ctproject"
        Group = "web"
  }

      root_block_device {
        volume_size = "10"
        volume_type = "gp2"
        delete_on_termination = "true"
    }
}
