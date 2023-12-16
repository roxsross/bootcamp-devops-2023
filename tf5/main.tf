terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "image" {
    name = "app"
    build {
        context = "."
        tag = ["app:1.0.0"]
    }
}

resource "docker_container" "container" {
    image= docker_image.image.image_id
    name = "app-run"
    ports {
        internal = 8080
        external = 8081
    }
}