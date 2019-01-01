locals {
  tags {
    managed_by    = "github.com/chuckyz/tf-modules/aws/instance"
    resource_type = "${var.resource_type}"
  }
}

data "aws_vpc" "vpc" {
  tags {
    Name = "${var.vpc_name}"
  }
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_search_string}*"]
  }
}

module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "2.9.1"

  name = "${var.name}"

  lc_name   = "${var.name}-lc"
  user_data = "${var.user_data}"

  image_id        = "${coalesce(var.ami_id, data.aws_ami.id)}"
  instance_type   = "${var.instance_type}"
  security_groups = "${var.security_groups}"

  root_block_device = [
    {
      volume_size = "${var.root_device_size}"
      volume_type = "${var.root_device_type}"
    },
  ]

  asg_name                  = "${var.name}-asg"
  vpc_zone_identifier       = "${var.subnet_ids}"
  health_check_type         = "EC2"
  min_size                  = "${var.min_asg_size}"
  max_size                  = "${var.max_asg_size}"
  desired_capacity          = "${var.desired_capacity}"
  wait_for_capacity_timeout = 0

  # The maps are consumed in the order provided, 
  # and duplicate keys overwrite previous entries
  tags_as_map = "${merge(local.tags, var.tags)}"
}
