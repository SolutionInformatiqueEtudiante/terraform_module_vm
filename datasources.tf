data "vsphere_virtual_machine" "this" {
  name          = var.template_name
  datacenter_id = var.datacenter_id
}

data "warpgate_role" "this" {
  count = var.bastion_infos.warpgate_role_id != null ? 1 : 0

  id = var.bastion_infos.warpgate_role_id
}
