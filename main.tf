terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = true
  override_special = ""
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}

output random_bucket_name_id {
    value = random_string.bucket_name.id
}


resource "aws_s3_bucket" "example" {
  bucket = "random_string.bucket_name.result"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}