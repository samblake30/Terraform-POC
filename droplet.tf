#Configure the Droplet with Terrform
provider "digitalocean" {
  token = "95b276cd47516648ec1c5f543f7f33a01e6c7a4d865ed157ce9f49ce0181c173"
}

resource "digitalocean_droplet" "mydrop" {
  image  = "ubuntu-18-04-x64"
  name   = "samblake30"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}
