locals {
  ci_file_user_filename    = "${var.vmid}_user.yml"
  ci_file_network_filename = "${var.vmid}_network.yml"

  # Remote storage locations
  ci_file_storage = "ci"
}

locals {
  user_file_data = templatefile(var.ci_user_path, {
    username    = var.username
    defaultpass = var.default_password
    pubkey      = file(pathexpand(var.pubkey_path))

    timezone = var.timezone

    hostname = var.hostname
    fqdn     = "${var.hostname}.${var.domain_name}"
  })

  network_file_data = var.ci_network_path != null ? templatefile(var.ci_network_path, {}) : null
}

resource "proxmox_virtual_environment_file" "ci_user_file" {
  content_type = "snippets"
  datastore_id = local.ci_file_storage
  node_name    = var.target_node

  source_raw {
    data      = local.user_file_data
    file_name = local.ci_file_user_filename
  }
}

resource "proxmox_virtual_environment_file" "ci_network_file" {
  count = local.network_file_data != null ? 1 : 0

  content_type = "snippets"
  datastore_id = local.ci_file_storage
  node_name    = var.target_node

  source_raw {
    data      = local.network_file_data
    file_name = local.ci_file_network_filename
  }
}
