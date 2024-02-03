terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.14.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  credentials = file("../key.json")
}

resource "google_storage_bucket" "test-bkt" {
  name     = var.bucket
  location = "US"
}
