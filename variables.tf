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

# variable "network_interfaces" {
#   type = map(object({
#     network_id   = string
#     adapter_type = optional(string, "vmxnet3")
#   }))
#   description = "Network interface's parameters"
#   default     = {}
# }

variable "network" {
  type = any
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
