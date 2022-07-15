#!/bin/bash

# Env Vars
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=ap-south-1 

create_repo_ecr() {
    repo_name=$2
    aws ecr create-repository --repository-name $repo_name --region $AWS_REGION
}

create_repo_ecr '04-analytics-service' 'analytics-service'
create_repo_ecr '05-databaseService' 'database-service'
create_repo_ecr '06-orderService' 'order-service'
create_repo_ecr '07-inventoryService' 'inventory-service'
create_repo_ecr '08-paymentService' 'payment-service'
create_repo_ecr '09-recommendationService' 'recommendation-service'
create_repo_ecr '10-authenticationService' 'authentication-service'
create_repo_ecr '11-client' 'client-service'
create_repo_ecr '12-opensearch-dashboards-no-security' 'opensearch-dashboards-no-security'
