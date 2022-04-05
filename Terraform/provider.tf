#Adding Google Provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.16.0"
    }
  }
}

provider "google" {
  credentials = file("service_account.json")
  #credentials = file(C:\Users\sunda\OneDrive\Desktop\terraform_training\SA_Key\mindtree-training-sundar-e920b4c791c3.json")
  project = "mindtree-training-sundar"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}