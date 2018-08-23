output "public" {
  value = "${aws_instance.ctproject.public_ip}"
}
output "private" {
  value = "${aws_instance.ctproject.private_ip}"
}
