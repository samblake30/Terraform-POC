provider "digitalocean" {
  token = "13094213e20e7d901cd12395a17dbd6426d70843a3da04377799bfd483accd52"
}

resource "digitalocean_droplet" "mylab" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "blr1"
  size   = "s-1vcpu-1gb"
}
