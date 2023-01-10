resource "aws_instance" "instance" {
    ami = "ami-0c2a1acae6667e438"
    instance_type = "t2.micro"
    
    subnet_id = "${aws_subnet.pub-subnet.id}"
    
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    
    key_name = "TFlab1"
    user_data = <<-EOF
    #!/bin/bash
    echo "*** Installing apache2"
    sudo apt update -y
    sudo apt install apache2 -y
    echo "*** Completed Installing apache2"
    EOF

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}
