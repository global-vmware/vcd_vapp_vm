## Virtual Application VM Terraform Module
This Terraform module will deploy a vApp and "X" number of Virtual Machines into an existing VMware Cloud Director (VCD) Environment.  This module can be used to provsion a new vApp and Virtual Machines into Rackspace Technology SDDC Flex VCD Data Center Regions.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2 |
| vcd | >= 3.8.2 |

## Resources

| Name | Type |
|------|------|
| [vcd_vapp_vm](https://registry.terraform.io/providers/vmware/vcd/3.8.2/docs/resources/vapp_vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vdc_org_name | Name of the Data Center Group Organization | string | `"Data Center Group Name Format: <Account_Number>-<Region>-<Account_Name>"` | no |
| vdc_group_name | Name of the Data Center Group | string | `"Data Center Group Name Format: <Account_Number>-<Region>-<Account_Name> <datacenter group>"` | no |
| vdc_name | Cloud Director VDC Name | string | `"Virtual Data Center Name Format: <Account_Number>-<Region>-<Segment Name>"` | no |
| vcd_edge_name | Name of the Data Center Group Edge Gateway | string | `"Edge Gateway Name Format: <Account_Number>-<Region>-<Edge_GW_Identifier>-<edge>"` | no |
| vm_sizing_policy_name | Cloud Director VM Sizing Policy Name | string | gp4.16  | no |
| vapp_org_network_name | Cloud Director Vapp Organization Network Name | string | US1-Segment-01 | no |
| catalog_name | Cloud Director Catalog Name | string | 1338829-US1-catalog | no |
| catalog_template_name | Cloud Director Catalog Template Name | string | Windows Server 2022 | no |
| vapp_name | Cloud Director Vapp Name | string | My Application | no |
| vm_name_environment | Environment of the VM | string | Prod | no |
| vm_app_name | Application name of the VM | string | App | no |
| vm_app_role | Role of the application running on the VM | string | Web | no |
| vm_computer_name_environment | Environment to be used in computer name | string | pd | no |
| vm_computer_name_app_name | Application name to be used in computer name | string | app | no |
| vm_computer_name_role | Role to be used in computer name | string | web | no |
| vm_count | Number of VMs to create | number | 2 | no |
| vm_cpu_hot_add_enabled | Flag to enable or disable hot adding CPUs to VMs | bool | true | no |
| vm_memory_hot_add_enabled | Flag to enable or disable hot adding memory to VMs | bool | true | no |
| vm_min_cpu | Minimum number of CPUs for each VM | number | 4 | no |
| network_type | Type of network to be created (org or vapp) | string | org | no |
| network_adapter_type | Type of network adapter for each VM | string | VMXNET3 | no |
| network_ip_allocation_mode | IP address allocation mode for each VM | string | MANUAL  | no |
| network_cidr | CIDR block for the network | string | 192.168.0.0/24 | no |
| vm_metadata_key_01 | Key for virtual machine metadata field | string | "Cost Center" | no |
| vm_metadata_value_01 | Value for virtual machine metadata field | string | "1001" | no |
| vm_metadata_key_02 | Key for virtual machine metadata field | string | "Operating System" | no |
| vm_metadata_value_02 | Value for virtual machine metadata field | string | "Ubuntu 22.04" | no |
| vm_metadata_key_03 | Key for virtual machine metadata field | string | "Role" | no |
| vm_metadata_value_03 | Value for virtual machine metadata field | string | "Web Server" | no |
| vm_metadata_key_04 | Key for virtual machine metadata field | string | "Version" | no |
| vm_metadata_value_04 | Value for virtual machine metadata field | string | "v1.0" | no |
| vm_metadata_user_access_readwrite | Access level for the virtual machine metadata | string | READWRITE | No |
| vm_metadata_is_system_false | Specifies if the metadata is system-generated or not | bool | false | No |

## Outputs

| Name | Description |
|------|-------------|
| vm_names | An array of formatted VM names. |
| vm_computer_names | An array of formatted computer names for each VM. |
| vm_sizing_policy_name | The name of the sizing policy retrieved from the VCD instance. |
| vm_networks | An array of network information for each VM. |
| vm_metadata_key_01 | The key for metadata value 01. |
| vm_metadata_value_01 | The value for metadata key 01. |
| vm_metadata_key_02 | The key for metadata value 02. |
| vm_metadata_value_02 | The value for metadata key 02. |
| vm_metadata_key_03 | The key for metadata value 03. |
| vm_metadata_value_03 | The value for metadata key 03. |
| vm_metadata_key_04 | The key for metadata value 04. |
| vm_metadata_value_04 | The value for metadata key 04. |

## Example Usage
This is an example of a main.tf file that would use the "github.com/global-vmware/vcd_vapp_vm" Module Source to create a Virtual Application and it's associated Virtual Machines.

The Terraform code example for the main.tf file is below:

```terraform
module "vapp_vm" {
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v1.1.0"
  
  vdc_org_name                      = "<US1-VDC-ORG-NAME>"
  vdc_group_name                    = "<US1-VDC-GRP-NAME>"
  vdc_name                          = "<US1-VDC-NAME>"
  vcd_edgegateway_name              = "<US1-VDC-EDGE-NAME>"
  catalog_name                      = "<US1-CATALOG-NAME>"
  catalog_template_name             = "Windows Server 2019"
  vapp_org_network_name             = "US1-Segment-01"
  network_cidr                      = "192.168.1.0/24"
  network_ip_allocation_mode        = "MANUAL" 

  vm_count                          = 2

  vapp_name                         = "My Development Application"
  vm_name_environment               = "Dev"
  vm_app_name                       = "MyApp"
  vm_app_role                       = "Web Server"
  vm_computer_name_environment      = "dv"
  vm_computer_name_app_name         = "myapp"
  vm_computer_name_role             = "web"
  
  vm_metadata_cost_center           = "IT Department-1001"
  vm_metadata_os                    = "Windows 2019"
  vm_metadata_role                  = "Web Server"
  vm_metadata_version               = "1.0"
  
}
```