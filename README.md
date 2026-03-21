├── .gitignore               # Tệp loại trừ không push lên VCS
├── README.md                # Tài liệu hướng dẫn sử dụng, phân công nhiệm vụ
├── terraform.tf             # Cấu hình cloud block (organization, workspaces)
├── providers.tf             # Định nghĩa và cấu hình các providers (aws, proxmox)
├── variables.tf             # Khai báo biến chung cho cấp Root (ví dụ: SSH key, region)
├── outputs.tf               # Xuất kết quả cuối cùng (ALB DNS, DB IP)
├── main.tf                  # Tệp Root gọi các modules aws và proxmox
│
├── files/                   # Thư mục chứa các tệp bổ trợ
│   ├── install_db.sh        # Script cài đặt DB (sử dụng trong Cloud-init)
│   └── secure_db.sql        # Script SQL bảo mật DB ban đầu
│
└── modules/                 # Thư mục chứa các modules IaC
    │
    ├── aws/                 # Module chuyên biệt cho AWS
    │   ├── main.tf          # Định nghĩa resource AWS (VPC, EC2, ALB, SG)
    │   ├── variables.tf     # Khai báo các biến đầu vào cho module AWS
    │   └── outputs.tf       # Xuất các outputs cần thiết (ví dụ: ALB DNS)
    │
    └── proxmox/             # Module chuyên biệt cho Proxmox
        ├── main.tf          # Định nghĩa resource Proxmox (VM, Cloud-init)
        ├── variables.tf     # Khai báo các biến đầu vào cho module Proxmox
        ├── outputs.tf       # Xuất các outputs cần thiết (ví dụ: DB IP)
        └── cloud-init/      # Thư mục con cho các tệp cloud-init chuyên biệt
            └── user_data.yaml # File cấu hình Cloud-init user data