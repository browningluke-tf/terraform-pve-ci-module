locals {
  ci_file_user_filename = "${var.vmid}_user.yml"

  # Remote storage locations
  ci_file_storage            = "ci"
  ci_file_relative_path_user = "snippets/${local.ci_file_user_filename}"
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
}

resource "terraform_data" "ci_user_file" {
  triggers_replace = local.user_file_data

  provisioner "file" {
    content     = local.user_file_data
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
