# Terraform Proxmox Cloud-Init Module
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.7 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.3.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.1 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 2.9.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.3.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.11 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.cloud_init_user_data_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.cloud_init_config_files](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [proxmox_vm_qemu.pve_vm_host](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_balloon"></a> [balloon](#input\_balloon) | n/a | `number` | `0` | no |
| <a name="input_ci_cdrom_storage"></a> [ci\_cdrom\_storage](#input\_ci\_cdrom\_storage) | n/a | `string` | `"local-lvm"` | no |
| <a name="input_ci_conf_path"></a> [ci\_conf\_path](#input\_ci\_conf\_path) | value | `string` | n/a | yes |
| <a name="input_cores"></a> [cores](#input\_cores) | n/a | `number` | `1` | no |
| <a name="input_default_password"></a> [default\_password](#input\_default\_password) | description | `string` | `"cloud1"` | no |
| <a name="input_disk"></a> [disk](#input\_disk) | n/a | <pre>list(object({<br>    size     = optional(string, "4G")<br>    location = optional(string, "local-lvm")<br>  }))</pre> | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | description | `string` | `""` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | value | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `number` | `512` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | n/a | <pre>list(object({<br>    bridge   = string<br>    vlan_tag = optional(number, -1)<br>    mac      = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_pubkey_path"></a> [pubkey\_path](#input\_pubkey\_path) | value | `string` | n/a | yes |
| <a name="input_pve_host"></a> [pve\_host](#input\_pve\_host) | description | `string` | n/a | yes |
| <a name="input_pve_private_key"></a> [pve\_private\_key](#input\_pve\_private\_key) | Key MUST be in authorized\_keys as command="scp -t /path/to/ci/snippets",no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty ssh-ed25519 <key> | `string` | n/a | yes |
| <a name="input_pve_user"></a> [pve\_user](#input\_pve\_user) | description | `string` | n/a | yes |
| <a name="input_qemu_os"></a> [qemu\_os](#input\_qemu\_os) | value | `string` | `"l26"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list(string)` | n/a | yes |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | n/a | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | n/a | `string` | `""` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | value | `string` | `"America/Vancouver"` | no |
| <a name="input_username"></a> [username](#input\_username) | description | `string` | `"luke"` | no |
| <a name="input_vmid"></a> [vmid](#input\_vmid) | n/a | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
