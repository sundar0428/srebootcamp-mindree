#!/bin/bash

#Shell script to delete GKE cluster called my-cluster with Centos Image 

gcloud container clusters delete my-cluster --zone "europe-west2-a" --project "mindtree-training-sundar"