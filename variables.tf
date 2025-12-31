variable "app_name" {
    type = string
    description = "The name of the application"
    default = "serverless-demo"
}

variable "env" {
    type = string
    description = "Target environment(de/prod)"
}

variable "tags" {
    type = map(string)
    default = {
        Project = "Devops Roadmap"
    }
}

variable "runtimes" {
    type = map(string)
    default = {
        GoRunTime ="provided.al2023"
        NodeRunTime = "nodejs18.x"
    }
}

variable "runtime_configs" {
    type = map(object({
        runtime = string
        handler = string
    }))
    default = {
        node = {runtime = "nodejs18.x", handler = "index.handler"}
        go = {runtime = "provided.al2023", handler = "bootstrap"}
    }
}

data "aws_caller_identity" "current" {}
