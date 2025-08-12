# Staging1-Public launch configuration
resource "aws_launch_configuration" "ECS-Public" {
    name = "ECS-Public"
    image_id = "${var.amzn-ami-ew2}"
    instance_type = "t2.medium"
    iam_instance_profile = "ecsInstanceRole"
    associate_public_ip_address = true

    root_block_device {
        volume_type = "gp2"
        volume_size = 22
        delete_on_termination = false
    }

    lifecycle {
        create_before_destroy = true
    }

    security_groups = ["${aws_security_group.ECS-Public.id}"]
    key_name = "devops"
    user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=Public >> /etc/ecs/ecs.config
EOF
}

## Autoscaling group
resource "aws_autoscaling_group" "ECS-Public" {
    name = "ECS-Public"
    max_size = "4"
    min_size = "1"
    desired_capacity = "2"
    vpc_zone_identifier = [
        "${aws_subnet.Staging-Public-A.id}",
        "${aws_subnet.Staging-Public-B.id}"
    ]
    launch_configuration = "${aws_launch_configuration.ECS-Public.name}"
    health_check_type = "EC2"
    tags = {
	key = "Name"
        value = "ECS-Public"
	propagate_at_launch = true
    }
}

## ECS Cluster
resource "aws_ecs_cluster" "Public" {
    name = "Public"
}
