output "vm_names" {
    value = [for i in range(var.vm_count) : format("%s %s %s %02d", var.vm_name_environment, var.vm_app_name, var.vm_app_role, i+1)]
}

output "vm_computer_names" {
    value = [for i in range(var.vm_count) : format("%s-%s-%s%02d", var.vm_computer_name_environment, var.vm_computer_name_app_name, var.vm_computer_name_role, i+1)]
}

output "vm_count" {
  value = var.vm_count
}

output "vm_metadata_cost_center" {
  value = var.vm_metadata_cost_center
}

output "vm_metadata_os" {
  value = var.vm_metadata_os
}

output "vm_metadata_role" {
  value = var.vm_metadata_role
}

output "vm_metadata_version" {
  value = var.vm_metadata_version
}

output "vm_sizing_policy_name" {
    value = data.vcd_vm_sizing_policy.sizing_policy.name
}

output "vm_networks" {
    value = [for i in range(var.vm_count) : {
        ip_address = cidrhost(var.network_cidr, i+10)
        network_name = var.vapp_org_network_name
    }]
}
