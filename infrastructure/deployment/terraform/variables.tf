##### Project

variable "project_id" {
  description = "Project ID used for all resources."
  type        = string
}

variable "project_number" {
  description = "Project Number used for all resources."
  type        = string
}

variable "use_shared_vpc" {
  description = "Use Shared VPC Network"
  type        = bool
  default     = false
}

variable "network_project_id" {
  description = "Network project ID used for all resources."
  type        = string
}

variable "region" {
  description = "Region used for all resources."
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "Network self link where the environment will be deployed. Should be of the form 'projects/PROJECT/global/networks/NETWORK' "
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork self link where the environment will be deployed. Private Service Connect must be enabled and configured in this network. Should be of the form 'regions/REGION/subnetworks/SUBNETWORK'"
  type        = string
}


##### Cloud Storage
#Vertex_bucket
variable "vertex_b_name" {
  description = "Bucket name suffix"
  type        = string
}
variable "vertex_b_storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "MULTI_REGIONAL"
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.vertex_b_storage_class)
    error_message = "Storage class must be one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}
variable "vertex_b_location" {
  description = "Bucket location."
  type        = string
  default     = "US"
}
variable "vertex_b_force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects."
  type        = bool
}
variable "vertex_b_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}
variable "vertex_b_uniform_bucket_level_access" {
  description = "Allow using object ACLs (false) or not (true, this is the recommended behavior) , defaults to true (which is the recommended practice, but not the behavior of storage API)."
  type        = bool
  default     = true
}
variable "vertex_b_versioning_enabled" {
  description = "Versioning for the vertex bucket."
  type        = bool
}
variable "vertex_b_lifecycle_rules" {
  description = "Lifecycle rules for the vertex bucket."
  type = map(object({
    action = object({
      type          = string
      storage_class = optional(string)
    })
    condition = object({
      age                        = optional(number)
      created_before             = optional(string)
      custom_time_before         = optional(string)
      days_since_custom_time     = optional(number)
      days_since_noncurrent_time = optional(number)
      matches_prefix             = optional(list(string))
      matches_storage_class      = optional(list(string))
      matches_suffix             = optional(list(string))
      noncurrent_time_before     = optional(string)
      num_newer_versions         = optional(number)
      with_state                 = optional(string)
    })
  }))
  default = {}
}


# Variables for Composer Bucket
variable "composer_b_name" {
  description = "Name for the Composer bucket."
  type        = string
}
variable "composer_b_storage_class" {
  description = "Storage class for the Composer bucket."
  type        = string
  default     = "STANDARD"
}
variable "composer_b_location" {
  description = "Location for the Composer bucket."
  type        = string
  default     = "US"
}
variable "composer_b_force_destroy" {
  description = "When deleting the Composer bucket, this boolean option will delete all contained objects."
  type        = bool
}
variable "composer_b_labels" {
  description = "Labels for the Composer bucket."
  type        = map(string)
}
variable "composer_b_uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access for the Composer bucket."
  type        = bool
  default     = true
}
variable "composer_b_versioning_enabled" {
  description = "Versioning for the Composer bucket."
  type        = bool
}
variable "composer_b_lifecycle_rules" {
  description = "Lifecycle rules for the Composer bucket."
  type = map(object({
    action = object({
      type          = string
      storage_class = optional(string)
    })
    condition = object({
      age                        = optional(number)
      created_before             = optional(string)
      custom_time_before         = optional(string)
      days_since_custom_time     = optional(number)
      days_since_noncurrent_time = optional(number)
      matches_prefix             = optional(list(string))
      matches_storage_class      = optional(list(string))
      matches_suffix             = optional(list(string))
      noncurrent_time_before     = optional(string)
      num_newer_versions         = optional(number)
      with_state                 = optional(string)
    })
  }))
  default = {}
}

# Variables for Temp Data MX Bucket
variable "tempdata_mx_b_name" {
  description = "Name for the Temp Data bucket."
  type        = string
}
variable "tempdata_mx_b_storage_class" {
  description = "Storage class for the Temp Data bucket."
  type        = string
  default     = "STANDARD"
}
variable "tempdata_mx_b_location" {
  description = "Location for the Temp Data bucket."
  type        = string
  default     = "US"
}
variable "tempdata_mx_b_force_destroy" {
  description = "When deleting the Temp Data bucket, this boolean option will delete all contained objects."
  type        = bool
}
variable "tempdata_mx_b_labels" {
  description = "Labels for the Temp Data bucket."
  type        = map(string)
}
variable "tempdata_mx_b_uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access for the Temp Data bucket."
  type        = bool
  default     = true
}
variable "tempdata_mx_b_versioning_enabled" {
  description = "Versioning for the Temp Data bucket."
  type        = bool
}

# Variables for Raw Data MX Bucket
variable "rawdata_mx_b_name" {
  description = "Name for the Raw Data MX bucket."
  type        = string
}
variable "rawdata_mx_b_storage_class" {
  description = "Storage class for the Raw Data MX bucket."
  type        = string
  default     = "STANDARD"
}
variable "rawdata_mx_b_location" {
  description = "Location for the Raw Data MX bucket."
  type        = string
  default     = "US"
}
variable "rawdata_mx_b_force_destroy" {
  description = "When deleting the Raw Data MX bucket, this boolean option will delete all contained objects."
  type        = bool
}
variable "rawdata_mx_b_labels" {
  description = "Labels for the Raw Data MX bucket."
  type        = map(string)
}
variable "rawdata_mx_b_uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access for the Raw Data MX bucket."
  type        = bool
  default     = false
}
variable "rawdata_mx_b_versioning_enabled" {
  description = "Enables versioning for the Raw Data MX bucket."
  type        = bool
  default     = false
}

# Variables for Insights Data MX Bucket
variable "insightsdata_mx_b_name" {
  description = "Name for the Insights Data MX bucket."
  type        = string
}
variable "insightsdata_mx_b_storage_class" {
  description = "Storage class for the Insights Data MX bucket."
  type        = string
  default     = "STANDARD"
}
variable "insightsdata_mx_b_location" {
  description = "Location for the Insights Data MX bucket."
  type        = string
  default     = "US"
}
variable "insightsdata_mx_b_force_destroy" {
  description = "When deleting the Insights Data MX bucket, this boolean option will delete all contained objects."
  type        = bool
}
variable "insightsdata_mx_b_labels" {
  description = "Labels for the Insights Data MX bucket."
  type        = map(string)
}
variable "insightsdata_mx_b_uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access for the Insights Data MX bucket."
  type        = bool
  default     = false
}
variable "insightsdata_mx_b_versioning_enabled" {
  description = "Enables versioning for the Insights Data MX bucket."
  type        = bool
  default     = false
}

#dataproc_bucket
variable "pb_name" {
  description = "Bucket name suffix"
  type        = string
}
variable "pb_storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "MULTI_REGIONAL"
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.pb_storage_class)
    error_message = "Storage class must be one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}
variable "pb_location" {
  description = "Bucket location."
  type        = string
  default     = "US"
}
variable "pb_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

#landing_bucket
variable "lb_name" {
  description = "Bucket name suffix"
  type        = string
}
variable "lb_storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "MULTI_REGIONAL"
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.lb_storage_class)
    error_message = "Storage class must be one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}
variable "lb_location" {
  description = "Bucket location."
  type        = string
  default     = "US"
}
variable "lb_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

#temporal_bucket
variable "tb_name" {
  description = "Bucket name suffix"
  type        = string
}
variable "tb_storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "MULTI_REGIONAL"
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.tb_storage_class)
    error_message = "Storage class must be one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}
variable "tb_location" {
  description = "Bucket location."
  type        = string
  default     = "US"
}
variable "tb_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

#transversal_bucket
variable "transversal_bucket" {
  description = "Transversal Bucket"
  type        = string
}

##### Cloud Composer

variable "cc_name" {
  description = "Name used for Composer environment."
  type        = string
}

variable "cc_service_account_create" {
  description = "Auto-create service account."
  type        = bool
  default     = false
}

variable "cc_service_account" {
  description = "Service account email. Unused if service account is auto-created."
  type        = string
  default     = null
}

variable "cc_image_version" {
  description = "Image version used for Composer environment. This encapsulates both the version of Cloud Composer functionality and the version of Apache Airflow."
  type        = string
}

variable "cc_additional_roles" {
  description = "Additional roles for Cloud Composer service account"
  type        = list(string)
}

variable "cc_scheduler_cpu" {
  description = "The number of CPUs for a single Airflow scheduler."
  type        = number
  default     = null
}

variable "cc_scheduler_memory_gb" {
  description = "The amount of memory (GB) for a single Airflow scheduler."
  type        = number
  default     = null
}

variable "cc_scheduler_storage_gb" {
  description = "The amount of storage (GB) for a single Airflow scheduler."
  type        = number
  default     = null
}

variable "cc_scheduler_count" {
  description = "The number of schedulers."
  type        = number
  default     = null
}

variable "cc_web_server_cpu" {
  description = "The number of CPUs for the Airflow web server."
  type        = number
  default     = null
}

variable "cc_web_server_memory_gb" {
  description = "The amount of memory (GB) for the Airflow web server."
  type        = number
  default     = null
}

variable "cc_web_server_storage_gb" {
  description = "The amount of storage (GB) for the Airflow web server."
  type        = number
  default     = null
}

variable "cc_worker_cpu" {
  description = "The number of CPUs for a single Airflow worker."
  type        = number
  default     = null
}

variable "cc_worker_memory_gb" {
  description = "The amount of memory (GB) for a single Airflow worker."
  type        = number
  default     = null
}

variable "cc_worker_storage_gb" {
  description = "The amount of storage (GB) for a single Airflow worker."
  type        = number
  default     = null
}

variable "cc_worker_min_count" {
  description = "The minimum number of Airflow workers that the environment can run."
  type        = number
  default     = null
}

variable "cc_worker_max_count" {
  description = "The maximum number of Airflow workers that the environment can run."
  type        = number
  default     = null
}

variable "cc_environment_size" {
  description = "The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database"
  type        = string

  validation {
    condition     = contains(["ENVIRONMENT_SIZE_SMALL", "ENVIRONMENT_SIZE_MEDIUM", "ENVIRONMENT_SIZE_LARGE"], var.cc_environment_size)
    error_message = "'cc_environment_size' must be 'ENVIRONMENT_SIZE_SMALL', 'ENVIRONMENT_SIZE_MEDIUM' or 'ENVIRONMENT_SIZE_LARGE'."
  } 
}

variable "cc_master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network. This range is used for assigning internal IP addresses to the cluster master or set of masters and to the internal load balancer virtual IP."
  type        = string
  default     = null
}

variable "cc_cluster_ipv4_cidr_block" {
  description = "The IP address range used to allocate IP addresses to pods in the cluster."
  type        = string
  default     = null
}

variable "cc_cluster_secondary_range_name" {
  description = "The IP address range name used to allocate IP addresses to pods in the cluster."
  type        = string
  default     = null
}

variable "cc_services_ipv4_cidr_block" {
  description = "The IP address range used to allocate IP addresses in this cluster."
  type        = string
  default     = null
}

variable "cc_services_secondary_range_name" {
  description = "The IP address range name used to allocate IP addresses in this cluster."
  type        = string
  default     = null
}

variable "cc_cloud_sql_ipv4_cidr_block" {
  description = "The CIDR block from which IP range in tenant project will be reserved for Cloud SQL."
  type        = string
  default     = null
}

variable "cc_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

variable "pypi_packages" {
  description = "PyPa packages."
  type        = map(string)
  default     = {}
}

variable "repository_name" {
  description = "Repository name"
  type        = string
  default     = null
}
##### Dataflow
variable "df_service_account_create" {
  description = "Auto-create service account."
  type        = bool
  default     = false
}

variable "df_service_account_name" {
  description = "Service account name. Unused if service account is auto-created."
  type        = string
  default     = null
}

variable "df_roles" {
  description = "Roles for Cloud Composer service account"
  type        = list(string)
}

#####Cloud run
variable "cr_service_account_create" {
  description = "Auto-create service account."
  type        = bool
  default     = false
}

variable "cr_service_account_name" {
  description = "Service account name. Unused if service account is auto-created."
  type        = string
  default     = null
}

variable "cr_roles" {
  description = "Roles for Cloud Composer service account"
  type        = list(string)
}

##### BigQuery ingest

variable "bq_ingest_staging_dataset_id" {
  description = "Dataset ID for raw data"
  type        = string
}

variable "bq_ingest_staging_location" {
  description = "Dataset location for raw data"
  type        = string
  default     = "US"
}

variable "bq_ingest_staging_dataset_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

variable "bq_ingest_staging_options" {
  description = "Options for the BigQuery staging dataset."
  type = object({
    default_table_expiration_ms     = optional(number, null)
    default_partition_expiration_ms = optional(number, null)
    delete_contents_on_destroy      = optional(bool, false)
    max_time_travel_hours           = optional(number, 168)
  })
}

variable "bq_ingest_assembly_vault_dataset_id" {
  description = "Dataset ID for raw data"
  type        = string
}

variable "bq_ingest_assembly_vault_location" {
  description = "Dataset location for raw data"
  type        = string
  default     = "US"
}

variable "bq_ingest_assembly_vault_dataset_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

variable "bq_ingest_assembly_vault_options" {
  description = "Options for the BigQuery assembly_vault dataset."
  type = object({
    default_table_expiration_ms     = optional(number, null)
    default_partition_expiration_ms = optional(number, null)
    delete_contents_on_destroy      = optional(bool, false)
    max_time_travel_hours           = optional(number, 168)
  })
}

variable "bq_ingest_data_vault_dataset_id" {
  description = "Dataset ID for raw data"
  type        = string
}

variable "bq_ingest_data_vault_location" {
  description = "Dataset location for raw data"
  type        = string
  default     = "US"
}

variable "bq_ingest_data_vault_dataset_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

variable "bq_ingest_data_vault_options" {
  description = "Options for the BigQuery data_vault dataset."
  type = object({
    default_table_expiration_ms     = optional(number, null)
    default_partition_expiration_ms = optional(number, null)
    delete_contents_on_destroy      = optional(bool, false)
    max_time_travel_hours           = optional(number, 168)
  })
}


variable "bq_ingest_soothsayer_dataset_id" {
  description = "Dataset ID for raw data"
  type        = string
}

variable "bq_ingest_soothsayer_location" {
  description = "Dataset location for raw data"
  type        = string
  default     = "US"
}

variable "bq_ingest_soothsayer_dataset_labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

variable "bq_ingest_soothsayer_options" {
  description = "Options for the BigQuery soothsayer dataset."
  type = object({
    default_table_expiration_ms     = optional(number, null)
    default_partition_expiration_ms = optional(number, null)
    delete_contents_on_destroy      = optional(bool, false)
    max_time_travel_hours           = optional(number, 168)
  })
}

variable "landing_project_id" {
  description = "Landing BigQuery Project Id"
  type        = string
  default     = null
}

variable "raw_project_id" {
  description = "Raw BigQuery Project Id"
  type        = string
  default     = null
}

variable "trusted_project_id" {
  description = "Trusted BigQuery Project Id"
  type        = string
  default     = null
}

variable "management_project_id" {
  description = "Management BigQuery Project Id"
  type        = string
  default     = null
}