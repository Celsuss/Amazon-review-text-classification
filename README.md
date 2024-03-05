# Amazon-review-text-classification
Amazon review text classification

## Requirements
Docker
Terraform
Minikube

## How to run
### Build docker images
``` bash
ansible-playbook ansible/build-images-playbook.yaml
terraform apply
```
### Access the frontend
Get frontend url by typing the following in your terminal:
```minikube service frontend-service --url -n review-text-classification-ns```
