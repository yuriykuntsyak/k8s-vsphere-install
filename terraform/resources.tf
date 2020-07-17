resource "vsphere_virtual_machine" "vm" {
  count            = var.virtual_machine_tot_num
  name             = "${var.virtual_machine_name_prefix}${count.index + 1}"
  datastore_id     = data.vsphere_datastore.ds.id
  host_system_id   = data.vsphere_host.host.id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  resource_pool_id = data.vsphere_resource_pool.rp.id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  wait_for_guest_net_timeout = 5  

  num_cpus = 2
  memory   = 4096

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size = "30"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${var.virtual_machine_name_prefix}${(count.index + 1)}"
        domain    = var.virtual_machine_domain
      }

      network_interface {
        ipv4_address = "${var.virtual_machine_network_address}${(var.virtual_machine_ip_address_start + count.index + 1)}"
        ipv4_netmask = var.virtual_machine_netmask_bits
      }

      ipv4_gateway    = var.virtual_machine_gateway
      dns_suffix_list = ["${var.virtual_machine_domain}"]
      dns_server_list = var.virtual_machine_dns_servers
    }
  }
  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -v -D prepare_k8s_hosts.yml --extra-vars 'targets=${self.name}'"
  }
}

