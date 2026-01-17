terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = var.ENDPOINT    // HTTP/HTTPS URL to the server 
  insecure = false            // Access HTTP request
  username = var.USERNAME    // Username on the server format: user@pam or user@pve
  password = var.PASSWORD    // Password for user on the PVE-server
}