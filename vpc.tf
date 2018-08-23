resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  tags {
    Name = "${var.name}-redshift"
  }
}

resource "aws_internet_gateway" "main" {
  tags {
    Name = "${var.name}-redshift"
  }
  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_default_route_table" "main" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }
  tags {
    Name = "autotec-${var.name}-redshift"
  }
}

data "aws_region" "current" {}

resource "aws_vpc_endpoint" "s3" {
  service_name  = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_id        = "${aws_vpc.main.id}"
}

resource "aws_vpc_endpoint_route_table_association" "s3" {
  route_table_id  = "${aws_default_route_table.main.id}"
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
}

resource "aws_subnet" "main" {
  availability_zone = "${var.availability_zones[count.index]}"
  cidr_block        = "${cidrsubnet(aws_vpc.main.cidr_block, 3, count.index)}"
  count             = "${local.availability_zones_count}"
  tags {
    Name = "${var.name}-${var.availability_zones[count.index]}"
  }
  vpc_id            = "${aws_vpc.main.id}"
}

resource "aws_security_group" "main" {
  egress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    self      = true
  }
  ingress {
    cidr_blocks = [
      "${var.whitelist_cidr_blocks}"
    ]
    from_port   = 5439
    protocol    = "tcp"
    to_port     = 5439
  }
  name        = "${var.name}-redshift"
  vpc_id      = "${aws_vpc.main.id}"
  tags {
    Name = "${var.name}-redshift"
  }
}
