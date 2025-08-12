provider "digitalocean" {
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
}

resource "digitalocean_droplet" "mydroplet" {
  # curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/account/keys"
  ssh_keys           = [123456]
  image              = "${var.ubuntu}"
  region             = "${var.nyc2}"
  size               = "${var.tiny}"
  private_networking = false
  backups            = false
  ipv6               = false
  name               = "ubuntu-${var.nyc2}-${count.index}"

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
    ]

    connection {
      type     = "ssh"
      key_file = "file(${HOME}/.ssh/id_rsa)"
      user     = "root"
      timeout  = "5m"
    }
  }

  count = 1
}
