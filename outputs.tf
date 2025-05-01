output "vm_ip" {
  value = vsphere_virtual_machine.this.default_ip_address
}

output "vm_cpu" {
  value = vsphere_virtual_machine.this.num_cpus
}

output "vm_memory" {
  value = vsphere_virtual_machine.this.memory
}

output "vm_name" {
  value = vsphere_virtual_machine.this.name
}

output "vm_storage" {
  value = var.disks[0].size
}
