output "lambda_arn" {
    value = aws_lambda_function.go_lambda.arn
    description = "The ARN of the Go Lambda function"
}

output "my_account_id" {
    value = data.aws_caller_identity.current.account_id
}

output "golang_timeout" {
    value = aws_lambda_function.go_lambda.timeout
    description = "The timeout of the Go Lambda function"
}