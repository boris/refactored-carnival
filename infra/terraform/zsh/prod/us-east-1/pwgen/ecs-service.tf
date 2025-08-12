resource "aws_ecs_service" "pwgen" {
    name = "pwgen-web"
    cluster = "${aws_ecs_cluster.Public.id}"
    launch_type = "FARGATE"
    task_definition = "${aws_ecs_task_definition.pwgen-web.family}:${max("${aws_ecs_task_definition.pwgen-web.revision}")}"
    desired_count = 1
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent = 200
}
