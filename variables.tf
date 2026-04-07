# ==========================================
# BIẾN CHO GOOGLE CLOUD PLATFORM (GCP)
# ==========================================

variable "gcp_project_id" {
  type        = string
  description = "Project ID của dự án trên Google Cloud"
  # Không đặt default ở đây, hãy điền trên giao diện Terraform Cloud
}

variable "gcp_region" {
  type        = string
  description = "Region mặc định để triển khai tài nguyên GCP"
  default     = "asia-southeast1" # Khu vực Singapore, độ trễ về VN thấp
}

# ==========================================
# BIẾN CHO PROXMOX (ON-PREMISE)
# ==========================================

variable "proxmox_api_url" {
  type        = string
  description = "URL của Proxmox API (VD: https://192.168.1.10:8006/api2/json)"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "Token ID của Proxmox (VD: terraform@pve!mytoken)"
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "Secret Key của Proxmox Token"
  sensitive   = true # Đánh dấu nhạy cảm để không in ra log
}
