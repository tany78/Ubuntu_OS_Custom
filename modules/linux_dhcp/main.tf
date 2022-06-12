# --------------------------------
# Data
# --------------------------------

data "vsphere_datacenter" "dc" {
    name = var.vm_datacenter
}

data "vsphere_datastore" "datastore" {
    name          = var.vm_datastore
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
    name          = var.vm_template
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
    name          = var.vm_network
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
    name            = var.vm_resource_pool
    datacenter_id   = data.vsphere_datacenter.dc.id
}


# --------------------------------
# Resources
# --------------------------------

# Linux VM with DHCP

resource "vsphere_virtual_machine" "linux-vm" {
    # VM placement #
    name             = var.vm_name
    folder           = var.vm_folder
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.datastore.id

    num_cpus = var.vm_vcpu_number
    memory = var.vm_memory_size
    #scsi_type = "${var.vm_scsi_type}"
    
    # Guest OS #
    guest_id = "ubuntu64Guest"

    # VM storage #
    disk {
        label            = "disk0"
        size             = var.vm_disk_size
        thin_provisioned = true
        eagerly_scrub    = false
    }

    # VM networking #
    network_interface {
        network_id   = data.vsphere_network.network.id
        adapter_type = "vmxnet3"
    }

    # Customization of the VM #
    clone {
        template_uuid = data.vsphere_virtual_machine.template.id

        customize {
            linux_options {
                host_name = var.vm_name
                time_zone = var.vm_time_zone
				domain    = var.vm_domain
            }
            
            # Empty network interface for DHCP
            network_interface {}
        }
    }
    
	wait_for_guest_net_routable = true
        
    # Execute script	
    provisioner "remote-exec" {
	connection {
		type	    = "ssh"
		insecure    = true
		user	    = var.vm_user
		password    = var.vm_password
		host        = vsphere_virtual_machine.linux-vm.default_ip_address
	}
    
	inline = [
      	    # Execute the script as sudo		
            "echo ${var.vm_password} | sudo -S sudo apt install nginx -y"
	]
    }
}
