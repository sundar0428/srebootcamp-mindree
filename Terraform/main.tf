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

  metadata_startup_script = "sudo yum install wget unzip -y; sudo wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip; sudo unzip terraform_1.1.7_linux_amd64.zip -d /usr/local/bin/; sudo yum install -y yum-utils; sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo; sudo yum install docker-ce docker-ce-cli containerd.io -y; sudo systemctl start docker; sudo docker pull eu.gcr.io/mindtree-training-sundar/my-web-server:v1"


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


// GKE with separately managed node pool
/*
resource "google_container_cluster" "gke_cluster" {
  name = var.clustername

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 2
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_preemptible_node_pool" {
  name       = var.nodepoolname
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    #preemptible  = true
    machine_type = "g1-small"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    //service_account = google_service_account.default.email
    //oauth_scopes    = [
    //"https://www.googleapis.com/auth/cloud-platform"
    //]
  }
}

# https://willianantunes.medium.com/the-easiest-way-to-run-a-container-on-gce-with-terraform-139b2ec8f03d

/*
module "gce-worker-container" {
  source          = "./gce-with-container"
  image           = "eu.gcr.io/${var.project}/my-web-server:v1"
  privileged_mode = true
  activate_tty    = true
  instance_name   = "sre-terminal"
  network_name    = "default"
}

*/