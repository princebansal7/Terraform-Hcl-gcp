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
}

resource "google_storage_bucket" "test-bkt" {
  name     = var.bucket
  location = "US"
}

// will logging in using
// gcloud auth login 
// gcloud auth application-default login