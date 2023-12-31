This is the readme File for Devops-Assignment-4


The following repository contains these files:

variable.tf // All the variables are coded here
ec2.tf // Creates two EC2 instances
security-group.tf // Creates Security group
iam-user.tf // Creates I am user
output.tf // fullfils the last task of displaying the IP address and IAM user details
vpc.tf // Creates VPC, subnets, Routetable, NATGateway


NOTE: the iam-user.tf file contains provider details but I have comented some part for your use case. I have hardcoded my aws cedentials and I know it is not the best practise. but I did mention the Enviroment variables.


ALSO: In the ec2.tf file, for remote-exec make sure to add your IP for SSH connection


