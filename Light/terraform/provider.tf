terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc03"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.ENDPOINT 
  pm_api_token_id = var.TOKEN_ID
  pm_api_token_secret = var.TOKEN_SECRET
  pm_tls_insecure = false
  pm_minimum_permission_check = false
}