resource "aws_sns_topic_subscription" "subscription" {
    topic_arn = "${var.topicArn}"
    protocol = "${var.protocol}"
    endpoint = "${var.subscriptionEndpoint}"
}
