resource "vsphere_virtual_machine" "this" {
  name             = var.name
  annotation       = var.description
  folder           = var.folder
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  num_cpus         = var.cpu
  memory           = var.ram
  guest_id         = data.vsphere_virtual_machine.this.guest_id
  firmware         = data.vsphere_virtual_machine.this.firmware

  dynamic "network_interface" {
    for_each = var.network.network_interfaces
    content {
      network_id   = network_interface.value.network_id
      adapter_type = network_interface.value.adapter_type
    }
  }

  dynamic "disk" {
    for_each = data.vsphere_virtual_machine.this.disks
    content {
      label            = disk.value.label
      size             = disk.value.size
      thin_provisioned = disk.value.thin_provisioned
      unit_number      = disk.value.unit_number
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.this.id
    customize {
      dynamic "linux_options" {
        for_each = var.is_linux == true ? [1] : [0]
        content {
          host_name = var.name
          domain    = var.network.domain
        }
      }
      # linux_options {
      #   host_name = each.key
      #   domain    = var.network.domain
      # }

      dynamic "network_interface" {
        for_each = var.network.network_interfaces
        content {
          ipv4_address = network_interface.value.ipv4_address
          ipv4_netmask = network_interface.value.ipv4_netmask
        }
      }
      dns_server_list = var.network.dns_server_list
      ipv4_gateway    = var.network.ipv4_gateway
    }
  }

  # lifecycle {
  #   ignore_changes = [ept_rvi_mode, hv_mode, tools_upgrade_policy]
  # }

  depends_on = [
    data.vsphere_virtual_machine.this
  ]
}
