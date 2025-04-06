output "vm_ip" {
  value = vsphere_virtual_machine.this.default_ip_address
}

output "vm_cpu" {
  value = vsphere_virtual_machine.this.num_cpus
}

output "vm_memory" {
  value = vsphere_virtual_machine.this.memory
}
