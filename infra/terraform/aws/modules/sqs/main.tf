resource "aws_sqs_queue" "queue" {
    name = "${var.sqs_name}"
}

resource "aws_sqs_queue_policy" "policy" {
    queue_url = "${aws_sqs_queue.queue.id}"
    policy = "${data.template_file.policy_template.rendered}"
}

data "template_file" "policy_template" {
    template = <<EOF
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "Sid1494364308343",
      "Effect": "Allow",
      "Principal": {
        "AWS": ["${var.user_arn}"]
      },
      "Action": ["${join("\",\"", var.actions)}"],
      "Resource": "${aws_sqs_queue.queue.arn}"
    }
  ]
}
EOF
}
