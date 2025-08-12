resource "aws_ecs_task_definition" "pwgen-web" {
    family = "pwgen-web"
    container_definitions = <<DEF
[
    {
        "launch_type": "fargate",
        "cpu": 128,
        "memory": 256,
        "essential": true,
        "image": "boris/pwgen-web:latest",
        "name": "webservice"
    }
]
DEF
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = "128"
    memory = "256"
}
