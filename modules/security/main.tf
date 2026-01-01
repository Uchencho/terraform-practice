resource "aws_iam_role" "lambda_exec_role" {
    name = "${var.env}-${var.app_name}-base-role"

    assume_role_policy = jsonencode(
        {
            Version = "2012-10-17"
            Statement = [
                {
                    Action = "sts:AssumeRole"
                    Effect = "Allow"
                    Principal = {
                        Service = "lambda.amazonaws.com"
                    }
                }
            ]
        }
    )
}

terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.0"
      configuration_aliases = [ aws ]  # This is the secret sauce for your east/west setup
    }
  }
}

output "iam_role_arn" {
    value = aws_iam_role.lambda_exec_role.arn
    description = "The ARN of the IAM role for the Lambda function"
}
