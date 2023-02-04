resource "proxmox_vm_qemu" "pve_vm_host" {
  depends_on = [
    null_resource.cloud_init_config_files,
  ]

  name = var.name
  vmid = var.vmid

  target_node = var.target_node
  clone       = var.template

  agent = 1

  /* Hardware */
  // CPU
  cores   = var.cores
  sockets = 1
  cpu     = "kvm64"
  // RAM
  memory  = var.memory
  balloon = var.balloon

  dynamic "network" {
    for_each = var.network

    content {
      model   = "virtio"
      bridge  = network.value.bridge
      tag     = network.value.vlan_tag
      macaddr = network.value.mac
    }
  }

  dynamic "disk" {
    for_each = var.disk

    content {
      type    = "scsi"
      size    = disk.value.size
      storage = disk.value.location
    }
  }

  /* Cloud-Init  */
  // sshkeys and other User-Data parameters are specified with a custom config file.
  cicustom = "user=${local.ci_file_storage}:${local.ci_file_relative_path_user}"
  // Create the Cloud-Init drive on the "local-lvm" storage
  cloudinit_cdrom_storage = var.ci_cdrom_storage
  os_type                 = "cloud-init"
}
