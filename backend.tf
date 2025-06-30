terraform {
  backend "s3" {
    bucket_name = "terraform-dev-9325309959"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}