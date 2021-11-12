resource "aws_api_gateway_rest_api" "demo_v2" {
  name = "Demo_v2_API"
}

resource "aws_api_gateway_resource" "demo_proxy" {
  rest_api_id = aws_api_gateway_rest_api.demo_v2.id
  parent_id   = aws_api_gateway_rest_api.demo_v2.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "demo_proxy_method" {
  rest_api_id   = aws_api_gateway_rest_api.demo_v2.id
  resource_id   = aws_api_gateway_resource.demo_proxy.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "demo_lambda" {
  rest_api_id = aws_api_gateway_rest_api.demo_v2.id
  resource_id = aws_api_gateway_method.demo_proxy_method.resource_id
  http_method = aws_api_gateway_method.demo_proxy_method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.hello_v2.invoke_arn
}

resource "aws_api_gateway_method" "demo_proxy_root" {
  rest_api_id   = aws_api_gateway_rest_api.demo_v2.id
  resource_id   = aws_api_gateway_rest_api.demo_v2.root_resource_id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "demo_lambda_root" {
  rest_api_id = aws_api_gateway_rest_api.demo_v2.id
  resource_id = aws_api_gateway_method.demo_proxy_method.resource_id
  http_method = aws_api_gateway_method.demo_proxy_method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.hello_v2.invoke_arn
}

resource "aws_api_gateway_deployment" "demo_api_deploy" {
  depends_on = [
    aws_api_gateway_integration.demo_lambda,
    aws_api_gateway_integration.demo_lambda_root,
  ]

  rest_api_id = aws_api_gateway_rest_api.demo_v2.id
  stage_name  = "demo_v2"
}

output "demo_url" {
  value = "http://localhost:4566/restapis/${aws_api_gateway_rest_api.demo_v2.id}/${aws_api_gateway_deployment.demo_api_deploy.stage_name}/_user_request_/index"
}
