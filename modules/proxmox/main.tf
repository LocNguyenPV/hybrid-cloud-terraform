resource "proxmox_vm_qemu" "db_server" {
  name        = "hybrid-db-server"
  target_node = var.target_node
  clone       = var.template_name
  os_type     = "cloud-init"

  # Cấu hình mạng
  ipconfig0 = "ip=${var.db_static_ip},gw=${var.db_gateway}"

  # ĐÂY LÀ ĐIỂM CHUẨN TIÊU CHÍ ĐỀ BÀI:
  # Truyền động User, Password và SSH Key từ HCP Terraform
  ciuser     = "sysadmin"
  cipassword = var.db_root_password
  sshkeys    = var.sysadmin_ssh_key

  # Để cài đặt Database tự động mà vẫn giữ tính động (dynamic), 
  # kỹ sư thường dùng provisioner chạy script sau khi VM mọc lên
  # và login vào bằng chính SSH Key vừa được cấp ở trên.
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y postgresql",
      # Truyền mật khẩu an toàn vào script cấu hình DB
      "sudo -u postgres psql -c \"ALTER USER postgres PASSWORD '${var.db_root_password}';\"",
      "sudo sed -i \"s/#listen_addresses = 'localhost'/listen_addresses = '*'/g\" /etc/postgresql/*/main/postgresql.conf",
      "sudo systemctl restart postgresql"
    ]

    connection {
      type        = "ssh"
      user        = "sysadmin"
      private_key = file("~/.ssh/id_rsa") # Máy Local Agent dùng Private Key tương ứng để chạy lệnh
      host        = self.default_ipv4_address
    }
  }
}
