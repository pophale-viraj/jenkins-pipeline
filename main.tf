data "aws_ami" "amazon-linux-3" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "dev-instance" {
  ami           = data.aws_ami.amazon-linux-3.id
  instance_type = var.instance_size
  count         = var.instance_count
  key_name      = var.instance_key

  tags = {
    Name        = "My Network"
    Environment = "Dev"
  }
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "example" {
  bucket = "var.bucket_name"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}