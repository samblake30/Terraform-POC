#Configure the Droplet with Terrform
provider "digitalocean" {
  token = "PUT YOUR TOKEN HERE"
}

resource "digitalocean_droplet" "mydrop" {
  image  = "ubuntu-18-04-x64"
  name   = "samblake30"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}
