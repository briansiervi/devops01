output "cdn_id" {
    value = data.aws_cloudfront_distribution.cloudfront_ds.id
    sensitive = true
    description = "Id do CloudFront"
}

output "cdn_domain_name" {
    value = data.aws_cloudfront_distribution.cloudfront_ds.domain_name
    sensitive = false
    description = "Nome de domínio do CloudFront"
}