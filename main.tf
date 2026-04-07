module "gcp_infrastructure" {
  source     = "./modules/gcp"
  project_id = var.gcp_project_id
  region     = var.gcp_region
}

module "proxmox_database" {
  source        = "./modules/proxmox"
  target_node   = "pve-01"
  template_name = "ubuntu-2204-cloudinit"
  db_static_ip  = "192.168.1.100/24"
  db_gateway    = "192.168.1.1"
}
