variable "vcd_user" {
  description = "Cloud Director Username"
  type        = string
  sensitive   = true
}
variable "vcd_pass" {
  description = "Cloud Director Password"
  type        = string
  sensitive   = true
}

variable "vcd_url" {
  description = "Cloud Director URL"
  default     = "https://us1.rsvc.rackspace.com/api"
}

variable "max_retry_timeout" {
  type        = number
  default     = 90
}

variable "allow_unverified_ssl" {
  type        = bool
  default     = true
}

variable "vdc_org_name" {
  type        = string
  description = "Cloud Director Organization Name"
  default     = ""
}

variable "vdc_group_name" {
  type        = string
  description = "Cloud Director Datacenter Group Name"
  default     = ""
}

variable "vdc_name" {
  type        = string
  description = "Cloud Director VDC Name"
  default     = ""
}

variable "vcd_edgegateway_name" {
  type        = string
  description = "Cloud Director Edge Name"
  default     = ""
}

variable "vm_sizing_policy_name" {
  type = string
  default = "gp4.16"
}

variable "vapp_org_network_name" {
  type = string
  default = "Segment-01"
}

variable "catalog_name" {
  type = string
  default = ""
}

variable "catalog_template_name" {
  type = string
  default = "Windows Server 2022"
}

variable "vapp_name" {
  type = string
  default = "My Application"
}

variable "vm_name_environment" {
  type = string
  default = "Prod"
}

variable "vm_app_name" {
  type = string
  default = "App"
}

variable "vm_app_role" {
  type = string
  default = "Web"
}

variable "vm_computer_name_environment" {
  type = string
  default = "pd"
}

variable "vm_computer_name_app_name" {
  type = string
  default = "app"
}

variable "vm_computer_name_role" {
  type = string
  default = "web"
}

variable "vm_count" {
  type = number
  default = 2
}

variable "vm_cpu_hot_add_enabled" {
  type = bool
  default = true
}

variable "vm_memory_hot_add_enabled" {
  type = bool
  default = true
}

variable "vm_min_cpu" {
  type = number
  default = 4
}

variable "network_type" {
  type = string
  default = "org"
}

variable "network_adapter_type" {
  type = string
  default = "VMXNET3"
}

variable "network_ip_allocation_mode" {
  type = string
  default = "MANUAL"
}

variable "network_cidr" {
  type = string
  default = "192.168.0.0/24"
}

variable "vm_metadata_role" {
  type = string
  default = "Web Server"
}

variable "vm_metadata_os" {
  type = string
  default = "Windows 2022"
}

variable "vm_metadata_version" {
  type = string
  default = "v1.0"
}

variable "vm_metadata_cost_center" {
  type = string
  default = "1001"
}

variable "vm_metadata_type_string_value" {
  type = string
  default = "MetadataStringValue"
}

variable "vm_metadata_user_access_readwrite" {
  type = string
  default = "READWRITE"
}

variable "vm_metadata_is_system_false" {
  type = bool
  default = false
}
