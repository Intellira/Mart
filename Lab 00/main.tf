locals {
  valid_classes = ["STANDARD", "NEARLINE", "COLDLINE", "ARCHIVE"]
  error_message = "Error ! Only Receive Standard, Nearline, Coldline, Archive"
}

resource "google_storage_bucket" "storage_bucket" {
  # Create Google Storage Bucket
  name = var.storage_name
  location = var.region
  storage_class = var.storage_class

  # Lifecycle : Control Terraform Handle Resources Creation, Update, Deletions
  # Prevent Accidental Deletion
  lifecycle {
    prevent_destroy = true
    
    # Precondition to Enforce Conditions Before Applying to Resources
    precondition {
      condition = contains(local.valid_classes, var.storage_class)
      error_message = local.error_message
    }
  }
}
