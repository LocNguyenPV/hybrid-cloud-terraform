terraform {
  cloud {
    organization = "iac-projects"
    workspaces {
      name = "hybrid-gcp-proxmox"
    }
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9"
    }
  }
}
