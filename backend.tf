terraform {
  backend "s3" {
    bucket = "terraform-state-ts823"
    key    = "terraform/test1"

}
}
