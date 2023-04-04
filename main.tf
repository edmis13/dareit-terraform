resource "google_storage_bucket" "static" {
  project       = "western-cascade-378410"
  name          = "my-bucket-task7"
  location      = "US"
  storage_class = "STANDARD"

 uniform_bucket_level_access = true
}

resource "google_compute_instance" "dareit-vm-ci-v2" {
  name         = "dareit-vm-tf-ci-v2"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}