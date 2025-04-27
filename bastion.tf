resource "warpgate_target" "this" {
  count = var.warpgate_role_id != null ? 1 : 0

  name = var.name

  ssh_options {
    host     = var.network.network_interfaces[0].ipv4_address
    port     = var.bastion_target_port
    username = var.bastion_target_username

    password_auth {
      password = var.bastion_target_password
    }
  }

  depends_on = [resource.vsphere_virtual_machine.this]
}

resource "warpgate_target_role" "this" {
  count = var.warpgate_role_id != null ? 1 : 0

  target_id = resource.warpgate_target.this[0].id
  role_id   = data.warpgate_role.this[0].id
}
