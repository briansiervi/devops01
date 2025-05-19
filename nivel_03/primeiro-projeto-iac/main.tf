resource "aws_s3_bucket" "local_s3_bucket" {
  bucket = "${var.org_name}-my-bucket-iac-${terraform.workspace}"

  tags = {
    Name    = "Primeiro bucket"
    Iac     = true
    Context = "${terraform.workspace}"
  }
}