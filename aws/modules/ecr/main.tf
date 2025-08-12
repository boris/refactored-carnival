resource "aws_ecr_repository" "repo" {
    name = "${var.repository_name}"
}

resource "aws_ecr_repository_policy" "repo-policy" {
    repository = "${aws_ecr_repository.repo.name}"
    policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "${var.repository_name}-policy",
            "Effect": "Allow",
            "Principal": {
                "AWS": ["${join("\",\"", var.users_arn)}"]
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:PutImage",
                "ecr:CompleteLayerUpload",
                "ecr:ListImages",
                "ecr:BatchGetImage",
                "ecr:InitiateLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:BatchCheckLayerAvailability",
                "ecr:UploadLayerPart"
            ]
        }
    ]
}
EOF
}
