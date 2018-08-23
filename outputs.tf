output "kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key used to encrypt the Cluster."
  value       = "${aws_kms_key.main.arn}"
}

output "cluster_id" {
  description = "The Redshift Cluster ID."
  value       = "${aws_redshift_cluster.main.id}"
}

output "cluster_identifier" {
  description = "The Cluster Identifier."
  value       = "${aws_redshift_cluster.main.cluster_identifier}"
}

output "database_name" {
  description = "The name of the default database in the Cluster."
  value       = "${aws_redshift_cluster.main.database_name}"
}

output "endpoint" {
  description = "The Redshift endpoint."
  value       = "${aws_redshift_cluster.main.endpoint}"
}

output "host" {
  description = "The Redshift host, derived from the endpoint."
  value       = "${element(split(":", aws_redshift_cluster.main.endpoint), 0)}"
}

output "master_password" {
  description = "The master password to the Redshift cluster"
  sensitive   = true
  value       = "${random_string.master_password.result}"
}

output "port" {
  description = "The Port the cluster responds on."
  value       = "${aws_redshift_cluster.main.port}"
}

output "vpc_id" {
  description = "The ID of the Redshift Cluster VPC."
  value       = "${aws_vpc.main.id}"
}