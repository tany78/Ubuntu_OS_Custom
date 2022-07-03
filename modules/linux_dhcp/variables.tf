# --------------------------------
# NON-DEFAULTS
# --------------------------------
# passed from the calling module

variable "vm_name" {
    description = "VM name"
}

variable "vm_template" {
    description = "VM Template to clone from"
}

# --------------------------------
# DEFAULTS
# --------------------------------
# REQUIRED TO SPECIFY HERE, OR PASS FROM CALLING MODULE
# Here, specify as: default = "<VALUE>"

variable "vm_folder" {
    description = "VM folder location"
    default = "Next-Gen"  # root folder
}

variable "vm_datacenter" {
    description = "VM data center"
    default = "CaaS-Engg-Lab"
}

variable "vm_vcpu_number" {
    description = "vCPU for the VM"
	default = 2
}

variable "vm_memory_size" {
    description = "RAM for the VM"
	default = 2048
}

variable "vm_disk_size" {
    description = "Disk for the VM"
	default = 30
}

variable "vm_datastore" {
    description = "VM datastore"
	default = "vsanDatastore"
}

variable "vm_domain" {
   description = "VM domain"
   default = "caas.lab.com"
}

variable "vm_time_zone" {
    description = "VM timezone"
	default = "Asia/Kolkata"
}

variable "vm_network" {
    description = "VM network"
	type = string
	default = "DHCP-PortGrp"
}

variable "vm_resource_pool" {
    description = "VM resource pool"
	default = "vSAN-RPool"
}

variable "vm_user" {
    description = "VM user"
    default = "administrator@vsphere.local"
}

variable "vm_password" {
    description = "VM password"
    default = "Uc@@s312"
}
