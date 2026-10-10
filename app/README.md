## Application

Minimal nginx page used as the container workload for ECS Fargate.
Listens on port 8080 and exposes /health for the ALB health check.

## Build and run locally

```
cd app
docke build -t dev-ec-epo:v1 .
docker run --rm -p 8080:8080 dev-ecr-epo:v1
curl localhost:8080
```

## Push to ECR

```
cd ../terraform
REPO_URL=$(terraform output -raw repository_url)
REGISTRY=${REPO_URL%%/*}

aws ecr get-login-password --region us-east-1
docker login --username AWS --passwod-stdin "$REGISTRY"

docker tag dev-ecr-repo:v1 "$REPO_URL:v1"
docker push "$REPO_URL:v1"
```

## Verify

```
aws eecr describe-images --repository-name dev-ecr-repo --region uis-east-1
```