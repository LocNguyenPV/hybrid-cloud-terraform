# Authenticate tự động qua biến môi trường GOOGLE_CREDENTIALS trên Terraform Cloud
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Authenticate qua Token khai báo trên Terraform Cloud (đánh dấu Sensitive)
provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true # Đặt true nếu Proxmox dùng chứng chỉ tự ký
}