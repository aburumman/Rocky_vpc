resource "google_project_service" "cloud_resource_manager" {
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "storage" {
  service = "storage.googleapis.com"
  disable_on_destroy = false
  
}

resource "google_compute_network" "vpc_network" {
  name = var.vpc_network
}
resource "google_compute_subnetwork" "public-subnetwork" {
  name          = "terraform-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}


resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags         = ["test", "dev"]

  metadata = {
    ssh-keys = "${var.username}:${file("~/.ssh/id_ed25519.pub")}"
  }

  boot_disk {
    initialize_params {
      #image = "rocky-linux-8-v20220406"
      image = var.boot_image
    }
  }

  network_interface {
    network = "default"
    #network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

