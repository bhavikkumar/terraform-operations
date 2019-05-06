terraform {
  backend "s3" {
    key     = "common/operations"
    encrypt = true
  }
}

locals {
  common_tags = {
    Owner       = "global"
    Environment = "production"
  }
}

data "terraform_remote_state" "master" {
  backend = "s3"
  config {
    bucket   = "terraform.bhavik.io"
    key      = "common/master"
    region   = "${var.aws_default_region}"
    profile  = "${var.profile}"
    role_arn = "${var.role_arn}"
  }
}