output "user_name" {
  description = "IAM user name"
  value       = join("", aws_iam_user.devops-user.*.name)
}

output "user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = join("", aws_iam_user.devops-user.*.arn)
}

output "ec2_global_ips" {
  value = ["${aws_instance.my-instance.*.public_ip}"]
}
