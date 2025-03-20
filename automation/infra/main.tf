resource "google_compute_address" "static_ip" {
  name   = "${var.instance_name}-static-ip"
  region = var.region
}


resource "google_compute_instance" "my-instance" {
  name         = var.instance_name
  machine_type = "e2-standard-4"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20250305"
      size  = 100
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip       = google_compute_address.static_ip.address
      network_tier = "PREMIUM"
    }
  }

  metadata_startup_script = <<-EOT
#!/bin/bash
set -e

# Ensure the user exists
if ! id "${var.instance_user}" &>/dev/null; then
    useradd -m -s /bin/bash ${var.instance_user}
    echo "${var.instance_user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

# Ensure Ansible is installed
if ! command -v ansible &> /dev/null; then
    apt update -y
    apt install -y software-properties-common
    add-apt-repository --yes --update ppa:ansible/ansible
    apt install -y ansible
fi

# Output Ansible version
sudo -u ${var.instance_user} ansible --version

echo "Ansible installed successfully!"
EOT
}
