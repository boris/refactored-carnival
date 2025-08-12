provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}

resource "random_password" "password" {
  length  = 32
  special = true
}

resource "cloudflare_tunnel" "home" {
  account_id = var.account_id
  name       = "home-tf"
  secret     = base64encode(random_password.password.result)
}

resource "cloudflare_tunnel_config" "config" {
  account_id = var.account_id
  tunnel_id  = cloudflare_tunnel.home.id

  config {
    origin_request {
      connect_timeout          = "30s"
      disable_chunked_encoding = false
      keep_alive_connections   = 100
      keep_alive_timeout       = "1m30s"
      no_happy_eyeballs        = false
      no_tls_verify            = true
      proxy_address            = "127.0.0.1"
      proxy_port               = 0
      tcp_keep_alive           = "30s"
      tls_timeout              = "10s"
    }
    ingress_rule {
      hostname = "test.example.com"
      service  = "https://localhost"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_record" "tunnel" {
  name    = "test.insert-coin.org"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "${cloudflare_tunnel.home.id}.cfargotunnel.com"
  zone_id = "53bf1bcf7a833a6bc999af8509cc4804"
}
