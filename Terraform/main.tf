// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Compute Engine instance 
resource "google_compute_instance" "vm_instance" {
  name = var.instancename
  #name         = "var.instancename-${random_id.instance_id.hex}"
  machine_type = var.machinetype

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }


// Make sure terraform is installed on the new compute engine instance

metadata_startup_script = "sudo yum install wget unzip -y; sudo wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip; sudo unzip terraform_1.1.7_linux_amd64.zip -d /usr/local/bin/"


  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

/*
metadata_startup_script = <<SCRIPT
    #! /bin/bash 
    sudo yum install wget unzip -y 
    #sudo yum update -y 
    sudo wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip 
    sudo unzip terraform_1.1.7_linux_amd64.zip -d /usr/local/bin/
    SCRIPT
*/

output "internalip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}