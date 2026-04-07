output "gcp_web_ip" {
  value       = module.gcp_infrastructure.web_server_ip
  description = "Public IP của Web Server trên GCP"
}

output "proxmox_db_ip" {
  value       = module.proxmox_database.database_ip
  description = "IP nội bộ của Database trên Proxmox"
}
