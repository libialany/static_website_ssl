
provider "aws" {
  region = var.aws_region
  version = "~> 2.52"
}
variable "aws_region" {
  type = string
}
variable "LOCAL_S3_ORIGIN_ID" { }
variable "aws_s3_bucket_name" { }
variable "acm_cert" { }
variable "alter_domains" { }

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.aws_s3_bucket_name
    origin_id = var.LOCAL_S3_ORIGIN_ID

    custom_origin_config {
      http_port = "80"
      https_port = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled = true
  default_root_object = "index.html"
  aliases = [var.alter_domains]
  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress = true
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = var.LOCAL_S3_ORIGIN_ID
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = var.acm_cert
    ssl_support_method = "sni-only"
  }
}