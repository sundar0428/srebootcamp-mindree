//Compute Engine Output

output "internalip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output "instance_name" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}


//GKE Output
/*
output "kubernetes_cluster_name" {
  value       = google_container_cluster.gke_cluster.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.gke_cluster.endpoint
  description = "GKE Cluster Host"
}
*/