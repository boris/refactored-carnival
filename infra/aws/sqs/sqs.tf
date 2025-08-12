resource "aws_sqs_queue" "queue" {
  name                      = "local-demo-queue"
  delay_seconds             = 0      # From 0 to 900. Default is 0
  max_message_size          = 262144 # From 1024 to 262144 (256k)
  message_retention_seconds = 345600 # From 60 to 345600 (4 days)
  receive_wait_time_seconds = 0      # From 0 to 20
}
