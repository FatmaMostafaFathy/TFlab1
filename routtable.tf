resource "aws_route_table" "routetable" {
    vpc_id = "${aws_vpc.vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.igw.id}" 
    }
    
    tags = {
        Name = "route-table"
    }
}


resource "aws_route_table_association" "associat"{
    subnet_id = "${aws_subnet.pub-subnet.id}"
    route_table_id = "${aws_route_table.routetable.id}"
}