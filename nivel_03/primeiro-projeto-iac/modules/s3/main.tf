resource "aws_s3_bucket" "bucket" {
  bucket = "${var.s3_bucket_name}-${terraform.workspace}"
  
  tags = "${var.s3_tags}"
}

resource "aws_s3_bucket_website_configuration" "bucket_website" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket.bucket]
}