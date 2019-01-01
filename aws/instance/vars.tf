variable "ami_id" {
  type        = "string"
  description = "ID for AWS AMI"
  default     = ""
}

variable "ami_search_string" {
  type        = "string"
  description = "search string for AMI e.g.: mycorp-docker will search for mycorp-docker*"
  default     = ""
}

variable "name" {
  type        = "string"
  description = "name of instance"
  default     = "unnamed"
}

variable "resource_type" {
  type        = "string"
  description = "resource type tag to easily identify groups of instances"
  default     = "unidentified"
}

variable "root_device_size" {
  type        = "string"
  description = "Size of root EBS volume"
  default     = "50"
}

variable "root_device_type" {
  type        = "string"
  description = "Type of root EBS volume"
  default     = "gp2"
}

variable "tags" {
  type        = "map"
  description = "tags for instance"
  default     = {}
}

variable "user_data" {
  type        = "string"
  description = "AWS user_data script"
  default     = ""
}

variable "vpc_name" {
  type        = "string"
  description = "tag:name of desired VPC"
}