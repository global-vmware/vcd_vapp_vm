terraform {
  required_version = ">= 1.2"

  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.8.2"
    }
  }
}

data "vcd_vdc_group" "vdc_group" {
  name = var.vdc_group_name
}

data "vcd_nsxt_edgegateway" "edge_gateway" {
  org      = var.vdc_org_name
  owner_id = data.vcd_vdc_group.vdc_group.id
  name = var.vcd_edgegateway_name
}

data "vcd_network_routed_v2" "segment" {
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id
  name            = var.vapp_org_network_name
}

data "vcd_vm_sizing_policy" "sizing_policy" {
  name = var.vm_sizing_policy_name
}

data "vcd_catalog" "catalog" {
  name = var.catalog_name
}

data "vcd_catalog_vapp_template" "template" {
  catalog_id    = data.vcd_catalog.catalog.id
  name          = var.catalog_template_name
}

resource "vcd_vapp" "vapp" {
  name  = var.vapp_name
  org   = var.vdc_org_name
  vdc   = var.vdc_name
}

resource "vcd_vapp_org_network" "vappOrgNet" {
  vapp_name         = "${vcd_vapp.vapp.name}"
  org_network_name  = data.vcd_network_routed_v2.segment.name
}

resource "vcd_vapp_vm" "vm" {
  vapp_name               = "${vcd_vapp.vapp.name}"
  name                    = "${format("${var.vm_name_environment} ${var.vm_app_name} ${var.vm_app_role} %02d", count.index + 1)}"
  computer_name           = "${format("${var.computer_name_environment}-${var.vm_computer_name_app_name}-${var.vm_computer_name_role}%02d", count.index + 1)}"
  vapp_template_id        = data.vcd_catalog_vapp_template.template.id
  cpu_hot_add_enabled     = var.vm_cpu_hot_add_enabled
  memory_hot_add_enabled  = var.vm_memory_hot_add_enabled
  sizing_policy_id        = data.vcd_vm_sizing_policy.sizing_policy.id
  cpus                    = var.vm_min_cpu

  count                   = var.vm_count

  metadata_entry {
  key = "OS"
  value = var.vm_metadata_os
  type = var.vm_metadata_type_string_value
  user_access = var.vm_metadata_user_access_readwrite
  is_system = var.vm_metadata_is_system_false
  }

  metadata_entry {
  key = "Version"
  value = var.vm_metadata_version
  type = var.vm_metadata_type_string_value
  user_access = var.vm_metadata_user_access_readwrite
  is_system = var.vm_metadata_is_system_false
  }

  metadata_entry {
  key = "Cost Center"
  value = var.vm_metadata_cost_center
  type = var.vm_metadata_type_string_value
  user_access = var.vm_metadata_user_access_readwrite
  is_system = var.vm_metadata_is_system_false
  }


  network {
      type                = var.network_type
      adapter_type        = var.network_adapter_type
      name                = var.vapp_org_network_name
      ip_allocation_mode  = var.network_ip_allocation_mode
      ip                  = "${cidrhost(var.network_cidr, count.index + 50)}"
      is_primary          = true
  }

  depends_on = [vcd_vapp.vapp]
}

