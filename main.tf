# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "foo" {
  image = "k8s-tools"
  name  = "k8s-tools"
}