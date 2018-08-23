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

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"

  }
}

/*
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-east-1f"
    size = 20
    type = "gp2"
    tags {
        Name = "extra volume data"
    }
}


resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.ctproject.id}"
}
*/
