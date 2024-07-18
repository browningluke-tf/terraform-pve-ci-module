# Terraform Proxmox Cloud-Init Module
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 0.61.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.61.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_file.ci_network_file](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_file.ci_user_file](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_vm.vm](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_balloon"></a> [balloon](#input\_balloon) | n/a | `number` | `0` | no |
| <a name="input_ci_cdrom_storage"></a> [ci\_cdrom\_storage](#input\_ci\_cdrom\_storage) | n/a | `string` | n/a | yes |
| <a name="input_ci_network_path"></a> [ci\_network\_path](#input\_ci\_network\_path) | value | `string` | `null` | no |
| <a name="input_ci_user_path"></a> [ci\_user\_path](#input\_ci\_user\_path) | value | `string` | n/a | yes |
| <a name="input_cores"></a> [cores](#input\_cores) | n/a | `number` | `1` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | n/a | `string` | `"host"` | no |
| <a name="input_default_password"></a> [default\_password](#input\_default\_password) | description | `string` | `"cloud1"` | no |
| <a name="input_disk"></a> [disk](#input\_disk) | n/a | <pre>list(object({<br>    interface = string<br>    location  = string<br>    size      = optional(string, "4G")<br>    discard   = optional(string, "on")<br>    iothread  = optional(bool, true)<br>  }))</pre> | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | description | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | value | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `number` | `512` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | n/a | <pre>list(object({<br>    bridge   = string<br>    vlan_tag = optional(number, null)<br>    mac      = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_on_boot"></a> [on\_boot](#input\_on\_boot) | n/a | `bool` | `false` | no |
| <a name="input_pubkey_path"></a> [pubkey\_path](#input\_pubkey\_path) | value | `string` | n/a | yes |
| <a name="input_qemu_os"></a> [qemu\_os](#input\_qemu\_os) | value | `string` | `"l26"` | no |
| <a name="input_scsi_hardware"></a> [scsi\_hardware](#input\_scsi\_hardware) | value | `string` | `"virtio-scsi-single"` | no |
| <a name="input_started"></a> [started](#input\_started) | n/a | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list(string)` | n/a | yes |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | n/a | `string` | n/a | yes |
| <a name="input_template_id"></a> [template\_id](#input\_template\_id) | n/a | `number` | `null` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | value | `string` | `"America/Vancouver"` | no |
| <a name="input_username"></a> [username](#input\_username) | description | `string` | `"luke"` | no |
| <a name="input_vmid"></a> [vmid](#input\_vmid) | n/a | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
