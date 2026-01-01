
resource "aws_lambda_function" "go_lambda" {
  function_name = "MyGolangFunction"
  filename = data.archive_file.lambda_zip.output_path
  handler = var.runtime_configs.go.handler
  runtime = var.runtimes.GoRunTime
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256 # <-- ensures if the code changes, terraform will re-upload
  role = var.lambda_exec_role_arn
  timeout = local.lambda_timeout

  tags = local.common_tags
}

resource "aws_lambda_function" "node_lambda" {
    function_name = "${var.app_name}-${var.env}-lambda"
    role = var.lambda_exec_role_arn # <--- Reference
    handler = var.runtime_configs.node.handler
    runtime = var.runtimes.NodeRunTime
    memory_size = local.lambda_memory

    # Dummy file name for now
    filename = "${path.module}/output.zip"

    tags = merge(var.tags, {
        Environment = var.env
    })
}

# Automatic binary zipping
data "archive_file" "lambda_zip" {
    type = "zip"
    source_file = "${path.module}/bootstrap"
    output_path = "${path.module}/output.zip"
}
