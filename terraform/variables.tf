variable "vsphere_user_name" {
  type = string
}

variable "vsphere_user_password" {
  type = string
}

variable "vsphere_server_fqdn" {
  type = string
}

// The datacenter the resources will be created in.
variable "datacenter" {
  type = string
}

// The hosts to use when creating virtual machines.
variable "esxi_host" {
  type = string
}

// Name of the distributed switch
variable "vsphere_network" {
  type = string
}

// The resource pool the virtual machines will be placed in.
variable "resource_pool" {
  type = string
}

// The name of the datastore to create.
variable "datastore_name" {
  type = string
}

// The name of the template to use when cloning.
variable "template_name" {
  type = string
}


// Amount of VMs to create
variable "virtual_machine_tot_num" {
  type = string
}

// The name prefix of the virtual machines to create.
variable "virtual_machine_name_prefix" {
  type = string
}

// The domain name to set up each virtual machine as.
variable "virtual_machine_domain" {
  type = string
}

// The network address for the virtual machine in CIDR format.
variable "virtual_machine_network_address" {
  type = string
}

// Number of network mask bits
variable "virtual_machine_netmask_bits" {
  default = "24"
}

// The last octect that serves as the start of the IP addresses for the virtual
// machines. Given the value of 100, if the network address is
// 10.0.0.0/24, the 3 virtual machines will be assigned addresses 10.0.0.100,
// 10.0.0.101, and 10.0.0.102.
variable "virtual_machine_ip_address_start" {
  default = "1"
}

// The default gateway for the network the virtual machines reside in.
variable "virtual_machine_gateway" {
  type = string
}

// The DNS servers for the network the virtual machines reside in.
variable "virtual_machine_dns_servers" {
  type = list
}
