# -------------------------------------------------------
# PROVIDER CONFIGURATION VARIABLES
# -------------------------------------------------------

variable "vsphere_user" {
    description = "vSphere user name"
	default	    = "rittando"
}

variable "vsphere_password" {
    description = "vSphere password"
	default	    = "Aero@123"
}

variable "vsphere_vcenter" {
    description = "vCenter server FQDN or IP"
	default = "caas-vcenter1.caas.lab.com"
}

#variable "vsphere_unverified_ssl" {
#   description = "Is the vCenter using a self signed certificate (true/false)"
#	type = bool
#	default = true
#}

# -------------------------------------------------------
# RESOURCE CONFIGURATION VARIABLES
# -------------------------------------------------------

variable "vm_datacenter" {
    description = "vSphere data center"
	default = "CaaS-Engg-Lab"
}

variable "vm_linux_template" {
    description = "VM template for Linux"
	default = "Ubuntu-OS-Test"
}

