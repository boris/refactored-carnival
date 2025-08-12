resource "aws_elb" "my-classic-elb" {
    name = "my-classic-elb"
    subnets = [
        "${aws_subnet.Staging-Private-A.id}",
        "${aws_subnet.Staging-Private-B.id}"
    ]
    internal = true
    security_groups = ["${aws_security_group.my-classic-elb.id}"]

    listener {
        instance_port = 32200
        instance_protocol = "http"
        lb_port = 443
        lb_protocol = "http"
    }
    
    health_check {
        healthy_threshold = 10
        unhealthy_threshold = 2
        timeout = 5
        interval = 30
        target = "TCP:8200"
    }
}
