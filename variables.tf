variable "availability_zones" {
  description = "The avaiability zones to use for the Cluster subnets"
  type        = list(string)
}

variable "availability_zones_count" {
  description = "The number of availability zones"
  type        = number
}

variable "cidr_block" {
  description = "The CIDR block for the Cluster VPC."
  type        = string
}

variable "database_name" {
  default     = "dev"
  description = "The name of the first database to be created when the cluster is created."
  type        = string
}

variable "log_bucket" {
  description = "The log bucket to log S3 server logs to."
  type        = string
}

variable "master_username" {
  description = "Username for the master DB user."
  type        = string
}

variable "name" {
  description = "The name of resources created, used either directly or as a prefix."
  type        = string
}

variable "node_type" {
  default     = "dc2.large"
  description = "The node type to be provisioned for the cluster."
  type        = string
}

variable "number_of_nodes" {
  default     = 1
  description = "The number of compute nodes in the cluster."
  type        = string
}

variable "publicly_accessible" {
  default     = true
  description = "If true, the cluster can be accessed from a public network."
  type        = string
}

variable "role_arns" {
  default     = []
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = list(string)
}

variable "statement_timeout" {
  default     = 0
  description = "The value to assign to the PostgreSQL statement_timeout parameter."
  type        = string
}

variable "whitelist_cidr_blocks" {
  default = [
    "0.0.0.0/0",
  ]
  description = "List of CIDR blocks to whitelist for access to the Cluster."
  type        = list(string)
}

