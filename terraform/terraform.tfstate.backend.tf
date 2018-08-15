terraform {
  backend "s3" {
    bucket = "nasreddine-infra"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}
