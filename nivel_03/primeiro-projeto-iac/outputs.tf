output "bucket_domain_name" {
  value       = data.aws_s3_bucket.local_s3_bucket_datasource.bucket_domain_name
  sensitive   = false
  description = "Nome de domínio do bucket s3"
}

output "bucket_region" {
  value       = data.aws_s3_bucket.local_s3_bucket_datasource.region
  sensitive   = false
  description = "Região do bucket s3"
}
