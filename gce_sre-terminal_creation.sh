#!/bin/bash

#Shell script to create a compute instance called sre-terminal with Centos Image 

# Ask the compute instance name

echo "Hello, What do you want to name your compute engine instace"

read instance_name

echo "You are creating $instance_name with centos image"

gcloud compute instances create $instance_name --project=mindtree-training-sundar --zone=europe-west2-a --machine-type=f1-micro --network-interface=network-tier=PREMIUM,subnet=default --maintenance-policy=MIGRATE --service-account=271738677308-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/centos-cloud/global/images/centos-7-v20220303,mode=rw,size=20,type=projects/mindtree-training-sundar/zones/europe-west2-a/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any