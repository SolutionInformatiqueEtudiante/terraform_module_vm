variable "datacenter_name" {
  type        = string
  description = "Datacenter to create resources"
}

variable "datastore_name" {
  type        = string
  description = "Datastore to create vm"
}

variable "name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "description" {
  type        = string
  description = "Resource's description"
  default     = "Created by terraform"
}

variable "folder" {
  type        = string
  description = "VirtualMachine's folder"
  default     = null
}

variable "cluster_name" {
  type        = string
  description = "Cluster to create vm"
}

variable "template_name" {
  type        = string
  description = "Name of the template to use"
}

variable "cpu" {
  type        = number
  description = "Numbers of CPU to use"
  default     = 2
}

variable "ram" {
  type        = number
  description = "Numbers of RAM to use"
  default     = 4096
}

variable "network_interfaces" {
  type = map(object({
    network_id   = string
    adapter_type = optional(string, "vmxnet3")
  }))
  description = "Network interface's parameters"
  default     = {}
}

variable "disks" {
  type = list(object({
    label            = string
    size             = number
    thin_provisioned = optional(bool, true)
    unit_number      = number
  }))
  description = "Disk's parameters"
  default     = []
}
