locals {
    # If env is "prod", give it 1024MB; otherwise, keep it at 128MB  <- ternary operator
    lambda_memory = var.env == "prod" ? 1024 : 128

    # If env is "prod", give it 10 seconds; otherwise, keep it at 3 seconds  <- ternary operator
    lambda_timeout = var.env == "prod" ? 10 : 5
    
    common_tags = {
        Project = "Devops Roadmap"
        Environment = var.env
        Owner = "Uchencho"
        ManagedBy = "Terraform"
    }
}