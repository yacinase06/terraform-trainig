provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket = "yacine-tf-bucket-09072021"
  acl    = "private"

  tags = {
    Name        = "terraform"
    Environment = "Dev"
  }
}

resource "aws_default_vpc" "default" {}