# -------------------------------------------------------
# FOLDER RESOURCES
# -------------------------------------------------------

data "vsphere_datacenter" "dc" {
    name = var.vm_datacenter
}

#resource "vsphere_folder" "test_folder" {
#    path          = "TestFolder"
#    type          = "vm"
#    datacenter_id = data.vsphere_datacenter.dc.id
#}

# -------------------------------------------------------
# VIRTUAL MACHINE RESOURCES
# -------------------------------------------------------

# Terraform Customization will work if installed all dependencies, only on the supported OS list
# Dependencies: https://kb.vmware.com/s/article/2075048
# Supported OS list: https://partnerweb.vmware.com/programs/guestOS/guest-os-customization-matrix.pdf

module "linux-dhcp" {
    source      = "./modules/linux_dhcp/"
    vm_name     = "test-linux-dhcp"
#   vm_folder   = vsphere_folder.test_folder.path
    vm_template = var.vm_linux_template
#   vm_ip       = "172.1.1.71"  # REQUIRED
}

