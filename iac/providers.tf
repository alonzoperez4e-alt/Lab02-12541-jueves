terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Pull image
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# Create container
resource "docker_container" "foo" {
  image = docker_image.ubuntu.name
  name  = "foo"
}