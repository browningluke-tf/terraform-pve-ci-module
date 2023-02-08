terraform {
  required_version = "~> 1.3.7"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.13"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.3.0"
    }
  }
}
