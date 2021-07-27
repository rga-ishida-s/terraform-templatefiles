# terraform-templatefiles
terraform template files for AWS resources 

## Usage

- ex. create ecr repo

```bash
cd ./ecr/services/dev
terraform init # terraform setting init
terraform plan # Check in advance if the settings are correct
terraform apply # create aws ecr repo
```