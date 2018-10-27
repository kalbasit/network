resource "aws_route53_zone" "yl-codes" {
  name = "yl.codes"
}

resource "aws_route53_record" "yl-codes-ns" {
  zone_id = "${aws_route53_zone.yl-codes.zone_id}"
  name    = "yl.codes"
  type    = "NS"
  ttl     = "172800"

  records = [
    "${aws_route53_zone.yl-codes.name_servers.0}",
    "${aws_route53_zone.yl-codes.name_servers.1}",
    "${aws_route53_zone.yl-codes.name_servers.2}",
    "${aws_route53_zone.yl-codes.name_servers.3}",
  ]
}

resource "aws_route53_record" "yl-codes-mx" {
  zone_id = "${aws_route53_zone.yl-codes.zone_id}"
  name    = "yl.codes"
  type    = "MX"
  ttl     = "3600"

  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ALT3.ASPMX.L.GOOGLE.COM",
    "10 ALT4.ASPMX.L.GOOGLE.COM",
  ]
}

resource "aws_route53_record" "google_apps_domains-yl-codes-cname" {
  zone_id = "${aws_route53_zone.yl-codes.zone_id}"
  name    = "${element(var.google_apps_domains, count.index)}.yl.codes"
  type    = "CNAME"
  ttl     = "3600"

  records = [
    "ghs.googlehosted.com",
  ]

  count = "${length(var.google_apps_domains)}"
}

resource "aws_route53_record" "yl-codes-spf" {
  zone_id = "${aws_route53_zone.yl-codes.zone_id}"
  name    = "yl.codes"
  type    = "SPF"
  ttl     = "3600"

  records = [
    "v=spf1 include:_spf.google.com ~all",
  ]
}

resource "aws_route53_record" "yl-codes-txt" {
  zone_id = "${aws_route53_zone.yl-codes.zone_id}"
  name    = "yl.codes"
  type    = "TXT"
  ttl     = "3600"

  records = [
    "google-site-verification=JZHLZZhP1XVRH-05-9t5hdJP60JTSU7vNIHNJnPpJS8",
    "v=spf1 include:_spf.google.com ~all",
  ]
}