data "vsphere_datacenter" "this" {
  name = var.datacenter_name
}

data "vsphere_datastore" "this" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.this.id

  depends_on = [
    data.vsphere_datacenter.this
  ]
}

data "vsphere_compute_cluster" "this" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.this.id

  depends_on = [
    data.vsphere_datacenter.this
  ]
}

data "vsphere_virtual_machine" "this" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.this.id

  depends_on = [
    data.vsphere_datacenter.this
  ]
}
