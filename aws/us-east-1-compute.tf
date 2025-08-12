provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region  = "us-east-1"
}

resource "aws_instance" "public-instance" {
    ami = "${var.ubuntu1604}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.staging-public.id}"
    associate_public_ip_address = true
    key_name = "boris-aws"
    tags = {
        Name = "public-instance-${count.index}"
    }
    vpc_security_group_ids = [
        "${aws_security_group.allow-egress.id}",
        "${aws_security_group.admin-security-group.id}",
        "${aws_security_group.allow-http.id}"
    ]
}

resource "aws_instance" "private-instance" {
    ami = "${var.ubuntu1604}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.staging-private.id}"
    key_name = "boris-aws"
    tags = {
        Name = "private-instance-${count.index}"
    }
    vpc_security_group_ids = [
        "${aws_security_group.allow-egress.id}",
        "${aws_security_group.allow-internal.id}"
    ]
}
