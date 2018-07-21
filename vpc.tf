# Create VPC

resource "aws_vpc" "main" {
  cidr_block           = "${var.main_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "zettaform"
  }
}

# Main Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "main-gw"
  }
}

# Create Public Subnet 1

resource "aws_subnet" "pub-1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.pub-1}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "Pub-1"
  }
}

resource "aws_subnet" "pub-2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.pub-2}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "Pub-2"
  }
}

# Public Routing Table 
resource "aws_route_table" "pub-route-table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gw.id}"
  }

  tags {
    Name = "Pub-RT"
  }
}

# Adding Subnets to the Route Pub Table

resource "aws_route_table_association" "pub-1" {
  subnet_id      = "${aws_subnet.pub-1.id}"
  route_table_id = "${aws_route_table.pub-route-table.id}"
}

resource "aws_route_table_association" "pub-2" {
  subnet_id      = "${aws_subnet.pub-2.id}"
  route_table_id = "${aws_route_table.pub-route-table.id}"
}

## Creating Private Subnets

resource "aws_subnet" "pvt-1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.pvt-1}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "Pvt-1"
  }
}

resource "aws_subnet" "pvt-2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.pvt-2}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "Pvt-2"
  }
}

# add private subenet to the default Route table

resource "aws_route_table_association" "pvt-1" {
  subnet_id      = "${aws_subnet.pvt-1.id}"
  route_table_id = "${aws_vpc.main.default_route_table_id}"
}

resource "aws_route_table_association" "pvt-2" {
  subnet_id      = "${aws_subnet.pvt-2.id}"
  route_table_id = "${aws_vpc.main.default_route_table_id}"
}

# EIP
resource "aws_eip" "nat-ip" {}

# NATGW
resource "aws_nat_gateway" "main-nat" {
  allocation_id = "${aws_eip.nat-ip.id}"
  subnet_id     = "${aws_subnet.pub-1.id}"

  tags {
    Name = "main-nat"
  }
}

# Associate with the default routing table

resource "aws_default_route_table" "default" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.main-nat.id}"
  }

  # tags {
  #   Name = "default table"
  # }
}
