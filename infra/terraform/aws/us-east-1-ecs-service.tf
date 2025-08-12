resource "aws_ecs_service" "my-service" {
    name = "my-service"
    cluster = "${aws_ecs_cluster.Staging1-Internal.id}"
    task_definition = "${aws_ecs_task_definition.my-task-def.family}:${max("${aws_ecs_task_definition.my-task-def.revision}")}"
    desired_count = 1
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent = 200

    load_balancer {
        elb_name = "${aws_elb.my-classic-elb.name}"
        container_name = "webservice"
        container_port = 443
    }
}
