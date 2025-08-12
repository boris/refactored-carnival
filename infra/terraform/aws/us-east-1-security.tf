# Allow egress to all
resource "aws_security_group" "allow-egress" {
    name = "allow-egress"
    description = "allow egress to all from all"
    vpc_id = "${aws_vpc.Staging.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-egress"
    }
}

# Allow Internal Traffic
resource "aws_security_group" "allow-internal" {
    name = "allow-internal"
    description = "allow internal access from any to any"
    vpc_id = "${aws_vpc.Staging.id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.240.0.0/16"]
    }
    tags = {
        Name = "allow-internal"
    }
}

# Allow HTTP
resource "aws_security_group" "allow-http" {
    name = "allow-http"
    description = "allow http access from 0/0"
    vpc_id = "${aws_vpc.Staging.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-http"
    }
}

# Admin SG
resource "aws_security_group" "admin-security-group" {
    name = "admin-security-group"
    description = "default SG for admins"
    vpc_id = "${aws_vpc.Staging.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
    	"200.104.143.93/32",
    	"45.55.21.238/32"
        ]
    }
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = [
        	"200.104.143.93/32",
    	"45.55.21.238/32"
        ]
    }
    tags = {
        Name = "admin-security-group"
    }
}

# ELB SG
resource "aws_security_group" "my-classic-elb" {
    name = "my-classic-elb"
    description = "class elb SG"
    vpc_id = "${aws_vpc.Staging.id}"
    
    egress {
        from_port = 0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [
            "10.0.0.0/16",
            "10.1.0.0/16"
        ]
    }

    tags = {
        Name = "my-classic-elb"
    }
}
