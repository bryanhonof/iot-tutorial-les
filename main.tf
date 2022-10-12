terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "hello" {
  name         = "ghcr.io/bryanhonof/iot-tutorial-les:trunk"
  keep_locally = false
}

resource "docker_container" "hello" {
  image = docker_image.hello.latest
  name  = "tutorial"
  must_run = false
}
