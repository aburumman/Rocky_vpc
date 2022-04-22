terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region #"us-east1"
  zone        = var.zone   #"us-east1-b"
}