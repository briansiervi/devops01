data "aws_s3_bucket" "local_s3_bucket_datasource" {
    bucket = "my-bucket-iac-${terraform.workspace}"
}