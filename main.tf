
module "lambda_exec_role" {
    source = "./modules/security"
    env = var.env
    providers = {
        aws = aws
    }
}

module "go_lambda" {
  source = "./modules/lambda"
  env = var.env
  lambda_exec_role_arn = module.lambda_exec_role.iam_role_arn
  providers = {
    aws = aws.west
  }
}

module "node_lambda_east" {
    source = "./modules/lambda"
    env = var.env
    lambda_exec_role_arn = module.lambda_exec_role.iam_role_arn
    providers = {
        aws = aws
    }
}
