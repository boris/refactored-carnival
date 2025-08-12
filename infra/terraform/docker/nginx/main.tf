provider "docker" {
  host = "tcp://192.168.99.100:2376"
}

resource "docker_container" "demo-inacap" {
  image = "${docker_image.demo-inacap.latest}"
  name  = "demo-inacap-${count.index}"

  lifecycle {
    prevent_destroy = true
  }

  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "demo-inacap" {
  name = "boris/demo-inacap"
}
