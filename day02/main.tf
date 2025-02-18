terraform {
required_providers {
docker = {
source = "kreuzwerker/docker"
version = "~> 2.21.0"
}
}
}

resource "docker_image" "nginx_image" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
image = docker_image.nginx_image.latest
name = "tutorial"
ports {
internal = 80
external = 80
}
}