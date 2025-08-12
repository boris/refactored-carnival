variable "sqs_name" {
    description = "The name of the queue"
}

variable "user_arn" {
    description = "ARN of the user"
}

variable "actions" {
    type = "list"
    description = "Actions allowed"
}

