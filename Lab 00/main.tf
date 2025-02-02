locals {
  # Valid Google Cloud Storage Classes
  valid_classes = ["STANDARD", "NEARLINE", "COLDLINE", "ARCHIVE"]
  # Error Message
  error_message = "Error ! Only Receive Standard, Nearline, Coldline, Archive"
}


resource "google_storage_bucket" "storage_bucket" {
  # Create Google Storage Bucket
  name = var.storage_name
  # On Region
  location = var.region
  # With Storage Class
  storage_class = var.storage_class

  # Lifecycle : Control Terraform Handle Resources Creation, Update, Deletions
  lifecycle {
    # Prevent Accidental Deletion
    prevent_destroy = true
    
    # Precondition to Enforce Conditions Before Applying to Resources
    precondition {
      condition = contains(local.valid_classes, var.storage_class)
      # Return Error if Storage Classes Other Than the Defined
      error_message = local.error_message
    }
  }
}