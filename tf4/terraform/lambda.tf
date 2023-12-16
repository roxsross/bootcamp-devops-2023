resource "aws_lambda_function" "demo" {
  filename = var.package
  function_name = "${var.app_id}-${var.app_env}"
  runtime = "nodejs18.x"
  timeout = 10
  publish = true
  handler = "index.handler"
  source_code_hash = filesha256(var.package)
  role = "${aws_iam_role.lambda-role.arn}"
  environment {
        variables = {
            table = "${var.app_id}-${var.app_env}-db"
        }
    }
  tags = {
    Project = "demo-terraform"
    Owner = "DevOps Team"
    Environment ="${var.app_env}"
  }
  
}

resource "aws_iam_role" "lambda-role" {
  name = "${var.app_id}-${var.app_env}-Role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "${var.app_id}-${var.app_env}-policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:us-east-1:*:table/*"
    }
  ]
}
EOF

  
}

resource "aws_iam_role_policy_attachment" "lambda-policy" {
  role = aws_iam_role.lambda-role.name
  policy_arn = aws_iam_policy.policy.arn
}