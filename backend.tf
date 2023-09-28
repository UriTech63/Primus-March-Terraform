/* resource "aws_s3_bucket" "primus-s3" {
  bucket = "primus-s3"

  tags = {
    Name = "primus-s3"
  }
}



terraform {
  backend "s3" {
    bucket = "primus-s3"
    key    = "primus-tm-key/terraform-march-state"
     region = "us-east-1"
     # encrypt = "true"
    dynamodb_table = "terraform-lock"
  }
}*/


