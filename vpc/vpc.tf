# Internet VPC
resource "aws_vpc" "main" {
    count = "${length(var.vpc_cidr_blocks)}"
    cidr_block = "${element(var.vpc_cidr_blocks, count.index)}"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "main-${count.index}",
        Owner = "${var.owner}",
        Project = "${var.project}"
    }
}

# Subnets
resource "aws_subnet" "main-public-subnet" {
    count = "${length(var.subnets_cidr_blocks)}"
    vpc_id = "${element(aws_vpc.main.*.id, count.index)}"
    cidr_block = "${element(var.subnets_cidr_blocks, count.index)}"
    map_public_ip_on_launch = "true"
    availability_zone = "${element(var.aws_azs, count.index)}"

    tags {
        Name = "main-public-subnet-${count.index}",
        Owner = "${var.owner}",
        Project = "${var.project}"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
    count = "${length(var.vpc_cidr_blocks)}"
    vpc_id = "${element(aws_vpc.main.*.id, count.index)}"

    tags {
        Name = "main-gw-${count.index}",
        Owner = "${var.owner}",
        Project = "${var.project}"
    }
}

# Route Tables
resource "aws_route_table" "main-public-route-table" {
    count = "${length(var.vpc_cidr_blocks)}"
    vpc_id = "${element(aws_vpc.main.*.id, count.index)}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${element(aws_internet_gateway.main-gw.*.id, count.index)}"
    }

    tags {
        Name = "main-public-route-table-${count.index}",
        Owner = "${var.owner}",
        Project = "${var.project}"
    }
}

# Route Associations Public
resource "aws_route_table_association" "main-public-route-association" {
    count = "${length(var.subnets_cidr_blocks)}"
    subnet_id = "${element(aws_subnet.main-public-subnet.*.id, count.index)}"
    route_table_id = "${element(aws_route_table.main-public-route-table.*.id, count.index)}"
}
