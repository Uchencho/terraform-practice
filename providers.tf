terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0" # Use version 5.x
        }
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = "test"
    secret_key = "test"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true

    endpoints {
        lambda = "http://localhost:4566"
        iam = "http://localhost:4566"
        s3 = "http://localhost:4566"
        sts = "http://localhost:4566"
    }
}

provider "aws" {
    region = "us-west-1"
    access_key = "test"
    secret_key = "test"
    alias  = "west"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true

    endpoints {
        lambda = "http://localhost:4566"
        iam = "http://localhost:4566"
        s3 = "http://localhost:4566"
        sts = "http://localhost:4566"
    }
}
