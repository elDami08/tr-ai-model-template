terraform {
  backend "gcs" {
    # Specify your backend configuration here if needed
    # bucket  = "your-bucket-name"
    # prefix  = "terraform/state"
  }
}

locals {
  df_iam_project_roles = (
    (var.project_id == var.network_project_id)
    ? {
        "${var.project_id}" = var.df_roles
      }
    : {
        "${var.project_id}" = var.df_roles
        "${var.network_project_id}" = ["roles/compute.networkUser"]
      }
  )
}

# ---------------------------------------------------------------------------------------------------------
# ------------------------------------------ VERTEX AI 
# ---------------------------------------------------------------------------------------------------------

resource "google_notebooks_instance" "template_workbench_instance_1" {
  name = "template-oxxo-vertexai-us-east1c" #bresmart-oxxo-vertexai-us-east1b
  location = "us-east1-c"
  machine_type = "n1-standard-4"

  metadata = {
    idle-timeout-seconds=10800
  }

  vm_image {
    project      =  "ml-images"
    image_name = "c1-deeplearning-tf-2-15-cu121-v20240417-debian-11"
  }

  boot_disk_type = "PD_STANDARD"
  boot_disk_size_gb = 150 # As per the screenshot

  no_public_ip = false
  no_proxy_access = false

  network = "projects/daf-network-h-dev/global/networks/daf-net-dev-vpc-01"
  subnet = "projects/daf-network-h-dev/regions/us-east1/subnetworks/daf-net-dev-subnet-singularity-01"

  labels = {
    environment    = "sb"
    business_unit  = "tr"
    region         = "us"
    project        = "churn"
    repo           = "tr-ai-model-template"
    resource_type  = "vertex"
    os             = "debian-11"
    jupyter_kernel_01 = "python-3_10"
    jupyter_kernel_02 = "tensorflow-2_15"
  }
    # ... other configurations ...
}


#Extra permissions for members usign the instance
resource "google_project_iam_member" "account_extra_roles" {
  for_each  = toset([
    "roles/artifactregistry.admin",
    "roles/bigquery.dataEditor",
    "roles/cloudkms.admin",
    "roles/composer.user",
    "roles/storage.admin",
    "roles/aiplatform.admin"
  ])
  project   = var.project_id #Singularity
  role      = each.value
  member    = "group:daf_vertex_ia@digitalfemsa.com"
}

#Extra permissions for (external) members usign the instance
resource "google_project_iam_member" "account_extra_roles_ext" {
  for_each  = toset([
    "roles/bigquery.jobUser",
    "roles/bigquery.dataViewer"
  ])
  project   = var.project_id #Singularity
  role      = each.value
  member    = "group:daf_vertex_externos_temporal@digitalfemsa.com"
}
