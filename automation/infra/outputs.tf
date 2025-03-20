output "static_ip" {
  description = "Static Public IP of the VM"
  value       = google_compute_address.static_ip.address
}

output "instance_ip" {
  description = "External IP of the VM"
  value       = google_compute_instance.my-instance.network_interface[0].access_config[0].nat_ip
}
