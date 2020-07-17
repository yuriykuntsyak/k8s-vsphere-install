// "dc" looks up the datacenter where all resources will be
// placed.
data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

// "host" looks up the IDs for the hosts that will be used during
// datastore and distributed virtual switch creation, in addition to defining
// where each virtual machine will be placed. One virtual machine per host will
// be created.
data "vsphere_host" "host" {
  name          = "${var.esxi_host}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

// "rp" looks up the resource pool to place the virtual machines in.
data "vsphere_resource_pool" "rp" {
  name          = "${var.resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

//  Retrieve datastore information on vsphere
data "vsphere_datastore" "ds" {
  name          = "default-container-67074"
  datacenter_id = data.vsphere_datacenter.dc.id
}

// Retrieve network information on vsphere
data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

// "template" looks up the template to create the virtual machines as.
data "vsphere_virtual_machine" "template" {
  name          = "${var.template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
