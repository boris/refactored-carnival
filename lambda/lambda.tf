resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_lambda_function" "test" {
  filename      = "functions/hello_world_py.zip"
  function_name = "hello_world_py"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "hello_world.lambda_handler"

  source_code_hash = filebase64sha256("functions/hello_world_py.zip")

  runtime = "python3.8"

  environment {
    variables = {
      Name = "Test"
    }
  }
}

resource "aws_lambda_function" "hello_v2" {
  filename      = "functions/hello_world_py_v2.zip"
  function_name = "hello_world_py_v2"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "hello_world_v2.lambda_handler"

  source_code_hash = filebase64sha256("functions/hello_world_py_v2.zip")

  runtime = "python3.8"

  environment {
    variables = {
      Name = "Demo v2"
    }
  }
}

# Permission needed by API GW.
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.test.execution_arn}/*/*"
}

resource "aws_lambda_permission" "demo_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello_v2.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.demo_v2.execution_arn}/*/*"
}
