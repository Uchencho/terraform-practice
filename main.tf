# 1. The IAM Role for the Lambda
resource "aws_iam_role" "lambda_exec_role" {
    name = "demo_lambda_role"

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

# 2. The Lambda Function
resource "aws_lambda_function" "hello_world" {
    function_name = "HelloWorldFunction"
    role = aws_iam_role.lambda_exec_role.arn # <--- Reference
    handler = "index.handler"
    runtime = "nodejs18.x"

    # Dummy file name for now
    filename = "${path.module}/output.zip"
}

# Automatic binary zipping
data "archive_file" "lambda_zip" {
    type = "zip"
    source_file = "${path.module}/bootstrap"
    output_path = "${path.module}/output.zip"
}

# Reference the zip file in the Lambda resource
resource "aws_lambda_function" "go_lambda" {
  function_name = "MyGolangFunction"
  filename = data.archive_file.lambda_zip.output_path
  handler = "bootstrap"
  runtime = "provided.al2023"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256 # <-- ensures if the code changes, terraform will re-upload
  role = aws_iam_role.lambda_exec_role.arn
}