resource "aws_apigatewayv2_api" "api" {
    name = "${var.app_id}-${var.app_env}-api"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "stage" {
    api_id = aws_apigatewayv2_api.api.id
    name = "$default"
    auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda" {
    api_id = aws_apigatewayv2_api.api.id
    integration_type = "AWS_PROXY"
    payload_format_version = "2.0"
    integration_uri = aws_lambda_function.demo.invoke_arn
}

resource "aws_apigatewayv2_route" "route1" {
    api_id = aws_apigatewayv2_api.api.id
    route_key = "GET /items"
    target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_route" "route2" {
    api_id = aws_apigatewayv2_api.api.id
    route_key = "DELETE /items/{id}"
    target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_route" "route3" {
    api_id = aws_apigatewayv2_api.api.id
    route_key = "GET /items/{id}"
    target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_route" "route4" {
    api_id = aws_apigatewayv2_api.api.id
    route_key = "PUT /items"
    target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_lambda_permission" "permision" {
    statement_id = "AllowApiInvoke"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.demo.function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}