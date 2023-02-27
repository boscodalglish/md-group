resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = {
    Name = "www.${var.domain_name}"
    description = var.domain_name
  }
  comment = var.domain_name
}

resource "aws_route53_record" "www-b" {
  zone_id = aws_route53_zone.main.zone_id
  name = "www.${var.domain_name}"
  type = "A"
alias {
    name = var.website_domain
    zone_id = var.zone_id
    evaluate_target_health = false
  }
}

/* ACM */

# resource "aws_acm_certificate" "cert" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_route53_record" "cert_ex" {
#   for_each = {
#     for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = aws_route53_zone.main.zone_id
# }

# resource "aws_acm_certificate_validation" "valid_cert" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_ex : record.fqdn]
# }