data "aws_s3_bucket" "local_s3_bucket_datasource" {
  bucket = "${var.org_name}-my-bucket-iac-${terraform.workspace}"
}