provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "s3_bucket_name" {
  length = 2  # Generates two words
}

resource "aws_s3_bucket" "my_bucket" {
  bucket        = "my-unique-s3-bucket-${lower(random_pet.s3_bucket_name.id)}"  # Ensure the name is lowercase
  force_destroy = true
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
