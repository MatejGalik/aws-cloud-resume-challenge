provider "aws" {
  region = "us-east-1" 

}

resource "aws_lambda_function" "myfunc" {
  function_name = "cloudresume-test-api-v2"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "placeholder.handler"
  runtime       = "python3.11"
  filename         = "${path.module}/lambda/placeholder.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/placeholder.zip")
}

resource "aws_iam_role" "iam_for_lambda" {
  name_prefix = "resume-lambda-role"

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

resource "aws_iam_policy" "iam_policy_for_resume_project" {
  name        = "resume-lambda-policy"
  path        = "/"
  description = "AWS IAM Policy for managing the resume project role"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:*",
        "Effect" : "Allow"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:UpdateItem",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
        "dynamodb:Scan"
        ],
        "Resource" : "arn:aws:dynamodb:*:*:table/cloudresume_test"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.iam_policy_for_resume_project.arn
}



resource "aws_lambda_function_url" "url1" {
  function_name      = aws_lambda_function.myfunc.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}