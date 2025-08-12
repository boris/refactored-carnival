provider "aws" {
    access_key =  "ACCESS_KEY"
    secret_key = "SECRET_KEY"
    region = "us-east-1"
}
                                                                        
resource "aws_instance" "name" {
    count = 10
    ami = "ami-xxyyzz"
    instance_type = "t2.small"
    security_groups = [                                                 
        "FirstGroup",
	"SecondGroup"
    ]                                                                   
    key_name = "my-key"
    availability_zone = "us-east-1d"
    tags {
        Name = "instance-name-eip-${count.index}"
    }
}
                                                                        
resource "aws_eip" "network-name" {
    count = 10
}
                                                                        
resource "aws_eip_association" "network-association" {
    count = 10
    instance_id = "${element(aws_instance.name.*.id, count.index)}"     
    allocation_id = "${element(aws_eip.network-name.*.id, count.index)}"
}
