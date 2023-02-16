locals {
  ci_file_user_filename = "${var.vmid}_user.yml"

  # Local storage locations
  ci_file_local_path_user = "${var.ci_conf_path}/user.cfg"

  # Remote storage locations
  ci_file_storage            = "ci"
  ci_file_relative_path_user = "snippets/${local.ci_file_user_filename}"
}


resource "local_file" "cloud_init_user_data_file" {
  content = templatefile(local.ci_file_local_path_user, {
    username    = var.username
    defaultpass = var.default_password
    pubkey      = file(pathexpand(var.pubkey_path))

    timezone = var.timezone

    hostname = var.hostname
    fqdn     = "${var.hostname}.${var.domain_name}"
  })
  filename = "${var.ci_conf_path}/${local.ci_file_user_filename}.rendered"
}

resource "null_resource" "cloud_init_config_files" {

  triggers = {
    ci_file_id = local_file.cloud_init_user_data_file.id
  }

  provisioner "file" {
    source      = local_file.cloud_init_user_data_file.filename
    destination = "/${local.ci_file_user_filename}" # Non-standard path. Read note below
  }

  # Connection REQUIRES the following line in ~/.ssh/authorized_keys:
  # command="scp -t /path/to/ci/snippets",no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty ssh-ed25519 <key>
  # which will prevent the key from shell access & restrict SCP destination.
  # In /etc/ssh/sshd_config, the line:
  # Subsystem sftp internal-sftp
  # is commented out, to restrict sftp access (forces scp to use custom OpenSSL protocol).
  # NOTE: this only works with OpenSSH version <9.0 (since in >=9.0, scp uses sftp as backend)
  # TF `provisioner file` runs ssh + scp (remote), thus using `ForceCommand internal-stfp` does not work with TF.
  connection {
    type        = "ssh"
    host        = var.pve_host
    user        = var.pve_user
    private_key = var.pve_private_key
    agent       = false
  }
}
