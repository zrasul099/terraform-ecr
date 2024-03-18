provider "aws"{
  region = "us-west-2"
}
resource "aws_ecr_repository" "foo" {
  name                 = "bar"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
terraform {
  backend "s3" {
    bucket = "gitopsterrastate"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}