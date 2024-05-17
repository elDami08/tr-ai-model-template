##### Project
project_id = "daf-aip-singularity-comp-sb"
project_number = 950268938558
region = "us-east1"

landing_project_id = "daf-dp-landing-dev"
raw_project_id = "daf-dp-raw-dev"
trusted_project_id = "daf-dp-trusted-dev"
management_project_id = "daf-dp-management-dev"

use_shared_vpc      = true
network_project_id  = "daf-aip-singularity-comp-sb"

network = "projects/daf-network-h-dev/global/networks/daf-net-dev-vpc-01"
subnetwork = "projects/daf-network-h-dev/regions/us-east1/subnetworks/daf-net-dev-subnet-instances-01"

##### -------------------------------------------------------------- Cloud Storage
#Vertex bucket
vertex_b_name     = "tr-singularity-vertex-sb"
vertex_b_storage_class = "STANDARD" 
vertex_b_location = "US"
vertex_b_force_destroy = false
vertex_b_labels = {
  environment    = "sb"
  business_unit  = "tr"
  region         = "us"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
  resource_type  = "gcs"
}
vertex_b_uniform_bucket_level_access = false
vertex_b_versioning_enabled = true
vertex_b_lifecycle_rules = {
  "rule1" = {
    action = {
      type = "Delete"
      # storage_class is optional
    }
    condition = {
      age                = 20
      num_newer_versions = 5
    }
  }

}

# Composer Bucket
composer_b_name     = "tr-singularity-composer-sb"
composer_b_storage_class = "STANDARD"
composer_b_location = "US"
composer_b_force_destroy = false
composer_b_labels = {
  environment    = "sb"
  business_unit  = "tr"
  region         = "us"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
  resource_type  = "gcs"
}
composer_b_uniform_bucket_level_access = true
composer_b_versioning_enabled = true
composer_b_lifecycle_rules = {
  "rule1" = {
    action = {
      type = "Delete"
      # storage_class is optional
    }
    condition = {
      age                = 20
      num_newer_versions = 5
    }
  }

}

# Temp Data MX Bucket
tempdata_mx_b_name     = "tr-singularity-tempdata-mx-sb"
tempdata_mx_b_storage_class = "STANDARD"
tempdata_mx_b_location = "US"
tempdata_mx_b_force_destroy = false
tempdata_mx_b_labels = {
  environment    = "sb"
  business_unit  = "tr"
  region         = "us"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
  resource_type  = "gcs"
}
tempdata_mx_b_uniform_bucket_level_access = false
tempdata_mx_b_versioning_enabled = false

# Raw Data MX Bucket
rawdata_mx_b_name     = "tr-singularity-rawdata-mx-sb"
rawdata_mx_b_storage_class = "STANDARD"
rawdata_mx_b_location = "US"
rawdata_mx_b_force_destroy = false
rawdata_mx_b_labels = {
  environment    = "sb"
  business_unit  = "tr"
  region         = "us"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"  # Ensure valid format for labels
  resource_type  = "gcs"
}
rawdata_mx_b_uniform_bucket_level_access = false
rawdata_mx_b_versioning_enabled = false

# Insights Data MX Bucket
insightsdata_mx_b_name     = "tr-singularity-insightsdata-mx-sb"
insightsdata_mx_b_storage_class = "STANDARD"
insightsdata_mx_b_location = "US"
insightsdata_mx_b_force_destroy = false
insightsdata_mx_b_labels = {
  environment    = "sb"
  business_unit  = "tr"
  region         = "us"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"  # Ensure valid format for labels
  resource_type  = "gcs"
}
insightsdata_mx_b_uniform_bucket_level_access = false
insightsdata_mx_b_versioning_enabled = false


#dataproc_bucket
pb_name     = "op_dataproc_templates-dev"
pb_storage_class = "MULTI_REGIONAL" 
pb_location = "US"
pb_labels = {
  environment    = "dev"
  business_unit  = "data"
  project        = "daf-aip-singularity-comp-sb"
  repo           = "tr-ai-infrastructure-singularity"
}
#landing_bucket
lb_name     = "op_landing-dev"
lb_storage_class = "MULTI_REGIONAL" 
lb_location = "US"
lb_labels = {
  environment    = "dev"
  business_unit  = "data"
  project        = "daf-aip-singularity-comp-sb"
  repo           = "tr-ai-infrastructure-singularity"
}
#temporal_bucket
tb_name     = "op_temporal_files-dev"
tb_storage_class = "MULTI_REGIONAL" 
tb_location = "US"
tb_labels = {
  environment    = "dev"
  business_unit  = "data"
  project        = "daf-aip-singularity-comp-sb"
  repo           = "tr-ai-infrastructure-singularity"
}

#transversal_bucket
transversal_bucket     = "dp-dataflow-templates-dev"

##### Vertex AI
## Workbench
notebook_boot_disk_size = 10
notebook_data_disk_size = 100

##### Cloud Composer
cc_name = "op-composer" 
cc_environment_size      = "ENVIRONMENT_SIZE_SMALL"

cc_service_account_create = true
cc_service_account = "op-composer"

cc_image_version = "composer-2.4.3-airflow-2.5.3"

cc_additional_roles = [
  "roles/iam.serviceAccountUser",
  "roles/dataflow.admin",
  "roles/dataflow.worker",
  "roles/bigquery.admin",
  "roles/storage.admin",
  "roles/run.invoker",
  "roles/run.developer",
  "roles/pubsub.admin",
  "roles/secretmanager.secretAccessor"
]

########  Modify values for Google-managed components
cc_worker_cpu            = 0.5
cc_worker_memory_gb      = 1.875 
cc_worker_storage_gb     = 1
cc_worker_min_count      = 1
cc_worker_max_count      = 3

cc_scheduler_cpu         = 0.5
cc_scheduler_memory_gb   = 1.875
cc_scheduler_storage_gb  = 1
cc_scheduler_count       = 1

cc_web_server_cpu        = 0.5
cc_web_server_memory_gb  = 1.875
cc_web_server_storage_gb = 1

cc_master_ipv4_cidr_block    = "10.104.201.0/28"
cc_cluster_secondary_range_name   = "pods-op"  # Example: "pods"
cc_services_secondary_range_name  = "services-op" # Example: "services"
cc_cloud_sql_ipv4_cidr_block = "10.104.202.0/24"

cc_labels = {
  environment    = "dev"
  business_unit  = "data"
  project        = "daf-aip-singularity-comp-sb"
  repo           = "tr-ai-infrastructure-singularity"
}

pypi_packages = {
  munch           = ""
}

repository_name   = "optimus-prime-dev" 

##### Dataflow
df_service_account_create = true
df_service_account_name = "op-dataflow-sa" # Example: tf-dataflow

df_roles = [  # <- DO NOT CHANGE
  "roles/artifactregistry.reader",
  "roles/dataflow.admin",
  "roles/dataflow.worker",
  "roles/bigquery.dataEditor",
  "roles/bigquery.jobUser",
  "roles/storage.objectCreator",
  "roles/storage.objectUser",
  "roles/iam.serviceAccountUser"
]

##### Cloud Run
cr_service_account_create = true
cr_service_account_name = "op-cloudrun-sa" # Example: tf-dataflow

cr_roles = [
  "roles/run.developer",
  "roles/run.invoker",
  "roles/secretmanager.secretAccessor",
  "roles/iam.serviceAccountUser"
]

##### ------------------------------------------------------------------- BigQuery ingest staging
bq_ingest_staging_dataset_id = "staging" # Example: raw-data-dataset
bq_ingest_staging_location = "US"
bq_ingest_staging_options = {
  max_time_travel_hours = 48  # Valor específico para este entorno
}
bq_ingest_staging_dataset_labels = {
  environment    = "sb"
  business_unit  = "tr"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
}

##### BigQuery ingest assembly_vault
bq_ingest_assembly_vault_dataset_id = "assembly_vault" # Example: raw-data-dataset
bq_ingest_assembly_vault_location = "US"
bq_ingest_assembly_vault_options = {
  max_time_travel_hours = 48  # Valor específico para este entorno
}
bq_ingest_assembly_vault_dataset_labels = {
  environment    = "sb"
  business_unit  = "tr"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
}

##### BigQuery ingest data_vault
bq_ingest_data_vault_dataset_id = "data_vault" # Example: raw-data-dataset
bq_ingest_data_vault_location = "US"
bq_ingest_data_vault_options = {
  max_time_travel_hours = 120  # Valor específico para este entorno
}
bq_ingest_data_vault_dataset_labels = {
  environment    = "sb"
  business_unit  = "tr"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
}

##### BigQuery ingest soothsayer
bq_ingest_soothsayer_dataset_id = "soothsayer" # Example: raw-data-dataset
bq_ingest_soothsayer_location = "US"
bq_ingest_soothsayer_options = {
  max_time_travel_hours = 120  # Valor específico para este entorno
}
bq_ingest_soothsayer_dataset_labels = {
  environment    = "sb"
  business_unit  = "tr"
  project        = "singularity"
  repo           = "tr-ai-infrastructure-singularity"
}