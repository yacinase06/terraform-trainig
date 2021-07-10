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

resource "aws_security_group" "prod_sg"{
  name        = "prod-sg-web"
  description = "allow std http/https port inbound + Everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
  "Terraform" : "true"
  }

}
