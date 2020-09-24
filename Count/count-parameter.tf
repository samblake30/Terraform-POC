resource "aws_instance" "instance-1" {
    ami = "ami-09a7bbd08886aafdf"
    instance_type = "t2.micro"
    count =  3
}

#Above code refer the count parameter that removes the need for manually copy of resource block for same instance creation
/*
resource "aws_instance" "instance-2" {
    ami = "ami-09a7bbd08886aafdf"
    instance_type = "t2.micro"
}

resource "aws_instance" "instance-3" {
    ami = "ami-09a7bbd08886aafdf"
    instance_type = "t2.micro"
}
*/
