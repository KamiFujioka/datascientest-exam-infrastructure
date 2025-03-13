# data "aws_route53_zone" "hisuko" {
#   name         = "hisuko.com."
#   private_zone = false
# }
#
#
# resource "aws_acm_certificate" "grafana_staging" {
#   domain_name       = "grafana-staging.hisuko.com"
#   validation_method = "DNS"
#
#   tags = {
#     Environment = "staging"
#   }
# }
#
#
# resource "aws_route53_record" "grafana_staging_cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.grafana_staging.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       type   = dvo.resource_record_type
#       record = dvo.resource_record_value
#     }
#   }
#
#   zone_id = data.aws_route53_zone.hisuko.zone_id
#   name    = each.value.name
#   type    = each.value.type
#   ttl     = 60
#   records = [each.value.record]
# }
#
#
# resource "aws_acm_certificate_validation" "grafana_staging" {
#   certificate_arn         = aws_acm_certificate.grafana_staging.arn
#   validation_record_fqdns = [for record in aws_route53_record.grafana_staging_cert_validation : record.fqdn]
# }
#
#
# resource "aws_route53_record" "grafana_staging" {
#   zone_id = data.aws_route53_zone.hisuko.zone_id
#   name    = "grafana-staging"
#   type    = "A"
#
#   alias {
#     name                   = aws_lb.grafana.dns_name
#     zone_id                = aws_lb.grafana.zone_id
#     evaluate_target_health = true
#   }
# }
