/* VM */
variable "name" {
  type = string
}

variable "vmid" {
  type = number
}

variable "target_node" {
  type = string
}

variable "template" {
  type    = string
  default = ""
}

variable "cores" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 512
}

variable "balloon" {
  type    = number
  default = 0
}

variable "network" {
  type = list(object({
    bridge   = string
    vlan_tag = optional(number, -1)
  }))
}

variable "disk" {
  type = list(object({
    size     = optional(string, "4G")
    location = optional(string, "local-lvm")
  }))
}

variable "ci_cdrom_storage" {
  type    = string
  default = "local-lvm"
}

/* Cloud init config */

variable "ci_conf_path" {
  type        = string
  description = "value"
}

/* Hostname */
variable "hostname" {
  type        = string
  description = "value"
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "description"
}

/* User config */
variable "username" {
  type        = string
  default     = "luke"
  description = "description"
}

variable "default_password" {
  type        = string
  default     = "cloud1"
  description = "description"
}

variable "timezone" {
  type        = string
  default     = "America/Vancouver"
  description = "value"
}

variable "pubkey_path" {
  type        = string
  description = "value"
}

/* Proxmox Connection Details */
variable "pve_user" {
  type        = string
  description = "description"
  sensitive   = true
}

variable "pve_password" {
  type        = string
  description = "description"
  sensitive   = true
}

variable "pve_host" {
  type        = string
  description = "description"
  sensitive   = true
}
