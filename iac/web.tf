
resource "docker_network" "app_network" {
  name = "app_network-${terraform.workspace}"
}

# --- BD ---
resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.postgres.name

  env = [
    "POSTGRES_PASSWORD=secret"
  ]

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }
}

# --- API ---
resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = "lab/api"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}

# --- Web ---
resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = "lab/web"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}