output "Public IP" {
  value = "${digitalocean_droplet.mydroplet.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.mydroplet.name}"
}
