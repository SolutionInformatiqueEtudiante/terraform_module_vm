variable "name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "description" {
  type        = string
  description = "Resource's description"
}

variable "folder" {
  type        = string
  description = "VirtualMachine's folder"
}

variable "template_name" {
  type        = string
  description = "Name of the template to use"
}

variable "cpu" {
  type        = number
  description = "Numbers of CPU to use"
}

variable "ram" {
  type        = number
  description = "Numbers of RAM to use"
}

variable "network" {
  type = object({
    ipv4_gateway    = string
    domain          = string
    dns_server_list = list(string)
    network_interfaces = map(object({
      network_id   = string
      ipv4_address = string
      ipv4_netmask = number
      adapter_type = string
    }))
  })
  description = "Network parameters"
}

variable "disks" {
  type = list(object({
    size             = number
    thin_provisioned = optional(bool, true)
    unit_number      = number
  }))
  description = "Disk's parameters"
  # default     = []
}

variable "datacenter_id" {
  type        = string
  description = "ID of the datacenter to use"
}

variable "resource_pool_id" {
  type        = string
  description = "Resource Pool ID of the resource"
}

variable "datastore_id" {
  type        = string
  description = "ID of the datastore to use"
}

variable "is_linux" {
  type        = bool
  description = "Set if vm is Linux machine"
}
