resource "aws_ecs_task_definition" "my-task-def" {
    family = "my-task-def"
    container_definitions = <<DEF
[
    {
	"cpu": 64,
	"memory": 128,
	"environment": [{
	    "name": "FOO",
	    "value": "bar"
	    },{
	    "name": "NEW_FOO",
	    "value": "new_bar"
	}],
	"essential": true,
	"image": "boris/parrtos",
	"name": "webservice",
	"logConfiguration": {
	    "logDriver": "awslogs",
	    "options": {
		"awslogs-group": "MyService",
		"awslogs-region": "us-east-1",
	        "awslogs-stream-prefix": "webservice"
	    }
	},
	"PortMappings": [{
    	    "hostPort": 14443,
    	    "protocol": "tcp",
    	    "containerPort": 443
    	}]
    }
]
DEF
}
