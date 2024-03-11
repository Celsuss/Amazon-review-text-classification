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

### Access prefect server ui
Use port forwarding:
```kubectl port-forward svc/prefect-server 4200:4200```
and then go to the url http://localhost:4200/dashboard
