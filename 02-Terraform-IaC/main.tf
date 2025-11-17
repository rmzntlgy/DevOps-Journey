# 1. Terraform Ayarları
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# 2. Sağlayıcı (Provider) Tanımı
provider "docker" {
  # Docker soketine bağlan (Linux/Mac için standart)
  host = "unix:///var/run/docker.sock"
}

# 3. Kaynak: Docker İmajı (Malzeme)
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 4. Kaynak: Docker Konteyneri (İnşaat)
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "terraform_ile_nginx"
  
  ports {
    internal = 80
    external = 8000
  }
}
