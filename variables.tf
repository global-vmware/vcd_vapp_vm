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

variable "vcd_edge_name" {
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
  default = "Application"
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

variable "vm_customization_force" {
  type = bool
  default = false
}

variable "vm_customization_enabled" {
  type = bool
  default = true
}

variable "vm_customization_change_sid" {
  type = bool
  default = false
}

variable "vm_customization_allow_local_admin_password" {
  type = bool
  default = true
}

variable "vm_customization_must_change_password_on_first_login" {
  type = bool
  default = false
}

variable "vm_customization_auto_generate_password" {
  type = bool
  default = true
}

variable "vm_customization_admin_password" {
  type = string
  default = ""
}

variable "vm_metadata_key_01" {
  type = string
  default = "Cost Center"
}

variable "vm_metadata_value_01" {
  type = string
  default = "1001"
}

variable "vm_metadata_key_02" {
  type = string
  default = "Operating System"
}

variable "vm_metadata_value_02" {
  type = string
  default = "Ubuntu 22.04"
}

variable "vm_metadata_key_03" {
  type = string
  default = "Role"
}

variable "vm_metadata_value_03" {
  type = string
  default = "Web Server"
}

variable "vm_metadata_key_04" {
  type = string
  default = "Version"
}

variable "vm_metadata_value_04" {
  type = string
  default = "v1.0"
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
