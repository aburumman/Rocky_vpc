variable "project" {
  default = "booming-monitor-346320"
}

variable "credentials_file" {
  default = "/home/mustapha/booming-monitor.json"
}

variable "region" {
  default = "us-central1"

}

variable "zone" {
  default = "us-central1-c"

}

variable "vpc_network" {
  default = "terraform-network"
}

variable "boot_image" {
  default = "rocky-linux-cloud/rocky-linux-8"
}

variable "username" {
  default = "mustapha"
}