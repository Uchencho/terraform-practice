variable "app_name" {
    type = string
    description = "The name of the application"
    default = "serverless-demo"
}

variable "env" {
    type = string
    description = "Target environment(dev/prod)"
}
