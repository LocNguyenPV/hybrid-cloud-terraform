resource "google_compute_network" "hybrid_vpc" {
  name                    = "hybrid-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "web_subnet" {
  name          = "web-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.hybrid_vpc.id
}

resource "google_compute_firewall" "allow_http_ssh" {
  name    = "allow-http-ssh"
  network = google_compute_network.hybrid_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

resource "google_compute_instance" "web_node" {
  name         = "hybrid-web-node"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = google_compute_network.hybrid_vpc.id
    subnetwork = google_compute_subnetwork.web_subnet.id
    access_config {
      # Cấp Public IP
    }
  }

  tags = ["web-server"]
}
