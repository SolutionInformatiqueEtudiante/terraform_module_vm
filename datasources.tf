data "vsphere_virtual_machine" "this" {
  name          = var.template_name
  datacenter_id = var.datacenter_id
}
