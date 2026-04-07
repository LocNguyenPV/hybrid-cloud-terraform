output "database_ip" {
  value = proxmox_vm_qemu.db_server.default_ipv4_address
}
