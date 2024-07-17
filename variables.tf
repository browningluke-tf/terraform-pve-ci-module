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

variable "template_id" {
  type    = number
  default = null
}

variable "qemu_os" {
  type        = string
  description = "value"
  default     = "l26"
}

variable "scsi_hardware" {
  type        = string
  description = "value"
  default     = "virtio-scsi-single"
}

variable "cpu" {
  type    = string
  default = "host"
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
    vlan_tag = optional(number, null)
    mac      = optional(string, null)
  }))
}

variable "disk" {
  type = list(object({
    interface = string
    location  = string
    size      = optional(string, "4G")
    discard   = optional(string, "on")
    iothread  = optional(bool, true)
  }))
}

variable "tags" {
  type = list(string)
}

variable "started" {
  type    = bool
  default = true
}

variable "on_boot" {
  type    = bool
  default = false
}


variable "ci_cdrom_storage" {
  type = string
}

/* Cloud init config */

variable "ci_user_path" {
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

variable "pve_private_key" {
  type        = string
  description = "Key MUST be in authorized_keys as command=\"scp -t /path/to/ci/snippets\",no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty ssh-ed25519 <key>"
  sensitive   = true
}

variable "pve_host" {
  type        = string
  description = "description"
  sensitive   = true
}
