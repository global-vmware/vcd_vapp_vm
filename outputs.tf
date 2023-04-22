output "vm_names" {
    value = [for i in range(var.vm_count) : format("%s %s %s %02d", var.vm_name_environment, var.vm_app_name, var.vm_app_role, i+1)]
}

output "vm_computer_names" {
    value = [for i in range(var.vm_count) : format("%s-%s-%s%02d", var.vm_computer_name_environment, var.vm_computer_name_app_name, var.vm_computer_name_role, i+1)]
}

output "vm_count" {
  value = var.vm_count
}

output "vm_metadata_key_01" {
  value = var.vm_metadata_key_01
}

output "vm_metadata_value_01" {
  value = var.vm_metadata_value_01
}

output "vm_metadata_key_02" {
  value = var.vm_metadata_key_02
}

output "vm_metadata_value_02" {
  value = var.vm_metadata_value_02
}

output "vm_metadata_key_03" {
  value = var.vm_metadata_key_03
}

output "vm_metadata_value_03" {
  value = var.vm_metadata_value_03
}

output "vm_metadata_key_04" {
  value = var.vm_metadata_key_04
}

output "vm_metadata_value_04" {
  value = var.vm_metadata_value_04
}

output "vm_sizing_policy_name" {
    value = data.vcd_vm_sizing_policy.sizing_policy.name
}

output "vm_networks" {
    value = [for i in range(var.vm_count) : {
        ip_address = cidrhost(var.network_cidr, i+50)
        network_name = var.vapp_org_network_name
    }]
}
