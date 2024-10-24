provider "google" {
  project     = "primal-gear-436812-t0"
  region      = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "terraform-example"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

output "instance_ip" {
  value = google_compute_instance.example.network_interface.0.access_config.0.nat_ip
}
