terraform {
  required_version = "~> 1.9.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.13"
    }
  }
}
