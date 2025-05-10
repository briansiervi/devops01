resource "aws_s3_bucket" "local_s3_bucket" {
  bucket = "my-bucket-iac"
  
  tags = {
    Name = "Primeiro bucket"
    Iac = true
  }
}