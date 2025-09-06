resource "aws_route53_zone" "izzy_kiwi" {
  name = "izzy.kiwi"
}

resource "aws_route53_record" "izzy_kiwi_A" {
  zone_id = aws_route53_zone.izzy_kiwi.id
  name    = "izzy.kiwi."
  type    = "A"
  ttl     = "60"
  records = ["14.102.99.242"]
}

resource "aws_route53_record" "izzy_kiwi_MX" {
  zone_id = aws_route53_zone.izzy_kiwi.id
  name    = "izzy.kiwi."
  type    = "MX"
  ttl     = "60"
  records = ["1 SMTP.GOOGLE.COM."]
}

resource "aws_route53_record" "izzy_kiwi_TXT" {
  zone_id = aws_route53_zone.izzy_kiwi.id
  name    = "izzy.kiwi."
  type    = "TXT"
  ttl     = "60"
  records = ["google-site-verification=Gi6kirUbUthaf1Y8rsl3_7zv9awC-7wkjxhcQGWs_CE"]
}

resource "aws_route53_record" "cult_flat_izzy_kiwi_A" {
  zone_id = aws_route53_zone.izzy_kiwi.id
  name    = "cult-flat.izzy.kiwi."
  type    = "A"
  ttl     = "60"
  records = ["14.102.99.242"]
}

resource "aws_route53_record" "cult_flat" {
  for_each = toset([
    "\\052",
    "grafana",
    "alertmanager",
    "prometheus",
    "global-jam-25",
    "ditchcraft",
    "beans",
    "moths-domain",
    "router"
  ])
  zone_id = aws_route53_zone.izzy_kiwi.id
  name    = "${each.value}.izzy.kiwi."
  type    = "CNAME"
  ttl     = "60"
  records = ["cult-flat.izzy.kiwi"]
}
