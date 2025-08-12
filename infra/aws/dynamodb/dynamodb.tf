resource "aws_dynamodb_table" "test" {
  name           = "demo"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "orderId"

  attribute {
    name = "orderId"
    type = "S"
  }

}
