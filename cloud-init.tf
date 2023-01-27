locals {
  ci_file_user_filename = "${var.vmid}_user.yml"

  # Remote storage locations
  ci_file_storage            = "ci"
  ci_file_relative_path_user = "snippets/${local.ci_file_user_filename}"
}


resource "local_file" "cloud_init_user_data_file" {
  content = templatefile("${var.ci_conf_path}/user.cfg", {
    username    = var.username
    defaultpass = var.default_password
    pubkey      = file(pathexpand(var.pubkey_path))

    timezone = var.timezone

    hostname = "${var.hostname}"
    fqdn     = "${var.hostname}.${var.domain_name}"
  })
  filename = "${var.ci_conf_path}/${local.ci_file_user_filename}.rendered"
}

resource "null_resource" "cloud_init_config_files" {

  provisioner "file" {
    source      = local_file.cloud_init_user_data_file.filename
    destination = "/var/lib/${local.ci_file_storage}/${local.ci_file_relative_path_user}"
  }

  connection {
    type     = "ssh"
    host     = var.pve_host
    user     = var.pve_user
    password = var.pve_password
    agent    = false
  }
}
