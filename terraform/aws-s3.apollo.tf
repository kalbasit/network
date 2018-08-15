resource "aws_s3_bucket" "apollo" {
  provider = "aws.us-east-1"

  bucket = "kapollo"

  lifecycle {
    prevent_destroy = true
  }
}
