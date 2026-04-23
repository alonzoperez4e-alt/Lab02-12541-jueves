# Start a container
resource "docker_container" "api" {
  name  = "api-dev"
  image = "lab/api"
  ports{
    internal = 3000
    external = 4002
  }
}