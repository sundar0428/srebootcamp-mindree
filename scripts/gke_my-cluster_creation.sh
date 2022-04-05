#!/bin/bash

#Shell script to create a GKE cluster called my-cluster with 2 nodes

# Ask the name of the cluster

echo "Hello, What do you want to name your GKE cluster?"

read cluster_name

echo "Great!!! You are creating $cluster_name with 2 nodes"

gcloud beta container --project "mindtree-training-sundar" clusters create "$cluster_name" --zone "europe-west2-a" --no-enable-basic-auth --cluster-version "1.21.9-gke.1002" --release-channel "regular" --machine-type "e2-micro" --image-type "COS_CONTAINERD" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --max-pods-per-node "110" --num-nodes "2" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/mindtree-training-sundar/global/networks/default" --subnetwork "projects/mindtree-training-sundar/regions/europe-west2/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "0" --max-nodes "2" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes --node-locations "europe-west2-a"