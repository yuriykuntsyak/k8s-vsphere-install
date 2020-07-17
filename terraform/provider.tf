provider "vsphere" {
  # If you use a domain set your login like this "MyDomain\\MyUser"
  user           = var.vsphere_user_name
  password       = var.vsphere_user_password
  vsphere_server = var.vsphere_server_fqdn

  # if you have a self-signed cert
  allow_unverified_ssl = true
}
