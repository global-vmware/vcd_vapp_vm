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

variable "vdc_edge_name" {
  type        = string
  description = "Cloud Director Edge Name"
  default     = ""
}

variable "vm_sizing_policy_name" {
  type    = string
  default = "gp2.4"
}

variable "vapp_org_networks" {
  description = "List of vApp Org networks with their types"
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "is_fenced" {
  type    = bool
  default = false
  
}

variable "retain_ip_mac_enabled" {
  type    = bool
  default = false
}

variable "reboot_vapp_on_removal" {
  type    = bool
  default = true
}

variable "catalog_org_name" {
  type = string
}

variable "catalog_name" {
  type    = string
  default = ""
}

variable "boot_catalog_org_name" {
  type = string
  default = ""
}

variable "boot_catalog_name" {
  type = string
  default = ""
}

variable "inserted_media_iso_name" {
  type        = string
  description = "Name of the ISO in the catalog that will be the inserted boot media"
  default     = ""
}

variable "inserted_media_eject_force" {
  description = "Allows to pass answer to question in vCD (The guest operating system has locked the CD-ROM door and is probably using the CD-ROM) True means Disconnect anyway (and override the lock)"
  default = true
}

variable "boot_iso_image_name" {
  type        = string
  description = "Name of the ISO in the catalog used to derive boot_image_id"
  default     = ""
}

variable "catalog_template_name" {
  type    = string
  default = ""
}

variable "vapp_name" {
  type    = string
  default = "Production Application vApp"
}

variable "vm_name_format" {
  type        = string
  description = "Format for the VM name"
  default     = "%s %02d"
}

variable "vm_name" {
  type        = list(string)
  description = "List of VM names"
  default     = []
}

variable "computer_name_format" {
  type        = string
  description = "Format for the computer name"
  default     = "%s-%02d"
}

variable "computer_name" {
  type        = list(string)
  description = "List of computer names"
  default     = []
}

variable "vm_cpu_hot_add_enabled" {
  type    = bool
  default = false
}

variable "vm_memory_hot_add_enabled" {
  type    = bool
  default = false
}

variable "vm_min_cpu" {
  type    = number
  default = 2
}

variable "vm_os_type" {
  type    = string
  default = ""
}

variable "vm_hw_version" {
  type = string
  default = ""
}

variable "vm_firmware" {
  type = string
  default = "bios"
}

variable "vm_boot_delay" {
  type    = number
  default = 0
}

variable "vm_boot_retry_enabled" {
  type    = bool
  default = false
}

variable "vm_boot_retry_delay" {
  type    = number
  default = 0
}

variable "vm_efi_secure_boot" {
  type    = bool
  default = false
}

variable "vm_enter_bios_setup_on_next_boot" {
  type = bool
  default = false
}

variable "vm_count" {
  type    = number
  default = 2
}

variable "vm_metadata_entries" {
  description   = "List of metadata entries for the VM"
  type          = list(object({
    key         = string
    value       = string
    type        = string
    user_access = string
    is_system   = bool
  }))
  default = []
}

variable "disks_per_vm" {
  description = "Number of disks to assign to each VM"
  type        = number
  default     = 0
}

variable "vm_disks" {
  description   = "List of disks per virtual machine"
  type          = list(object({
    name        = string
    bus_number  = number
    unit_number = number
  }))
  default     = []
}

variable "internal_disks" {
  description = "List of internal disks for each VM"
  type = list(object({
    size_in_mb      = number
    bus_number      = number
    unit_number     = number
    bus_type        = string
    iops            = number
    storage_profile = string
  }))
  default = []
}

variable "vm_internal_disk_allow_vm_reboot" {
  description = "Ensures disks can be added to powered-on VMs"
  default     = true
}

variable "network_interfaces" {
  description           = "List of network interfaces for the VM"
  type                  = list(object({
    type                = string
    adapter_type        = string
    name                = string
    ip_allocation_mode  = string
    ip                  = string
    is_primary          = bool
  }))
  default = []
}

variable "vm_ips_index_multiplier" {
  description = "Number of network interfaces for each VM deployment"
  type        = number
  default     = 1
}

variable "vm_ips" {
  type    = list(string)
  default = [""]
}

variable "override_template_disks" {
  description = "A list of disks to override in the vApp template."
  type = list(object({
    bus_type        = string
    size_in_mb      = number
    bus_number      = number
    unit_number     = number
    iops            = number
    storage_profile = string
  }))
  default           = []
}

variable "vm_customization_force" {
  description = "Warning. Setting to true will cause the VM to reboot on every apply operation. This field works as a flag and triggers force customization when true during an update (terraform apply) every time. It never complains about a change in statefile. Can be used when guest customization is needed after VM configuration (e.g. NIC change, customization options change, etc.) and then set back to false. Note. It will not have effect when power_on field is set to false."
  type        = bool
  default     = false
}

variable "vm_customization_enabled" {
  description = "Enables guest customization which may occur on first boot or if the force flag is used. This option should be selected for Power on and Force re-customization to work."
  type        = bool
  default     = true
}

variable "vm_customization_change_sid" {
  description = "Allows to change SID (security identifier). Only applicable for Windows operating systems."
  type        = bool
  default     = true
}

variable "vm_customization_allow_local_admin_password" {
  description = "Allow local administrator password."
  type        = bool
  default     = true
}

variable "vm_customization_must_change_password_on_first_login" {
  description = "Require Administrator to change password on first login."
  type        = bool
  default     = false
}

variable "vm_customization_auto_generate_password" {
  description = "Auto generate password."
  type        = bool
  default     = true
}

variable "vm_customization_admin_password" {
  description = "Manually specify Administrator password."
  type        = string
  default     = null
}

variable "vm_customization_number_of_auto_logons" {
  description = "Number of times to log on automatically. 0 means disabled."
  type        = number
  default     = 0
}

variable "vm_customization_join_domain" {
  description = "Enable this VM to join a domain."
  type        = bool
  default     = false
}

variable "vm_customization_join_org_domain" {
  description = "Set to true to use organization's domain."
  type        = bool
  default     = false
}

variable "vm_customization_join_domain_name" {
  description = "Set the domain name to override organization's domain name."
  type        = string
  default     = null
}

variable "vm_customization_join_domain_user" {
  description = "User to be used for domain join."
  type        = string
  default     = null
}

variable "vm_customization_join_domain_password" {
  description = "Password to be used for domain join."
  type        = string
  default     = null
}

variable "vm_customization_join_domain_account_ou" {
  description = "Organizational unit to be used for domain join."
  type        = string
  default     = null
}

variable "vm_customization_initscript" {
  description = "Provide initscript to be executed when customization is applied."
  type        = string
  default     = null
}

variable "enable_guest_properties" {
  description = "Enable vApp guest_properties block"
  type        = bool
  default     = false
}

variable "guest_properties_map" {
  description = "Map of vApp guest properties (e.g., for F5 or other appliances)"
  type        = map(string)
  default     = {}
}