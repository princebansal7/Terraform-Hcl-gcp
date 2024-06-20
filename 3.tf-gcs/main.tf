resource "google_storage_bucket" "gcs-bkt" {
  name                        = "tf-bkt-using-terraform-prince"
  location                    = "US"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  labels = {
    "env"  = "dev"
    "dept" = "local-compliance"
  }

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

  retention_policy {
    is_locked        = true
    retention_period = 600
  }
}

resource "google_storage_bucket_object" "image1" {
  name   = "yorichii"
  source = "./1.jpg"
  bucket = google_storage_bucket.gcs-bkt.name
} 