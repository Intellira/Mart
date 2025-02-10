resource "google_compute_instance" "virtual_computer" {
  # Create Compute Engine
  name = var.virtual_machine_name
  machine_type = var.virtual_machine_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # Compute Engine Network
    network = "default"

    # Public Accessible
    access_config { }
  }
}