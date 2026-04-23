# Start a container
resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = "lab/api"
  ports{
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}

resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = "lab/web"
  ports{
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}