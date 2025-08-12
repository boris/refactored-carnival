provider "docker" {
  host = "tcp://192.168.99.100:2376"
}

resource "docker_container" "ubuntu" {
  image = "${docker_image.ubuntu.latest}"
  name  = "ubuntu-${count.index}"

  lifecycle {
    prevent_destroy = true
  }

  count = 4
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}
