variable "target_node" {
  type        = string
  description = "Tên node Proxmox sẽ chứa máy ảo"
}

variable "template_name" {
  type        = string
  description = "Tên của Template VM dùng để clone"
}

variable "db_static_ip" {
  type        = string
  description = "IP tĩnh và Subnet mask cho DB (VD: 192.168.1.100/24)"
}

variable "db_gateway" {
  type        = string
  description = "Default Gateway cho mạng nội bộ"
}

variable "sysadmin_ssh_key" {
  type        = string
  description = "Public SSH Key lấy từ HCP Terraform"
}

variable "db_root_password" {
  type        = string
  description = "Mật khẩu root DB lấy từ HCP Terraform"
  sensitive   = true # Khai báo để Terraform không in ra Terminal
}
