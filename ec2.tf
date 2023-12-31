resource "aws_key_pair" "my-key" {
  key_name = "my_tf_key"
  public_key = file("/home/rana/.ssh/id_rsa.pub")
}

resource "aws_instance" "my-instance" {
  count         = var.instance_count
  ami           = lookup(var.ami,var.aws_region)
  instance_type = var.instance_type
  key_name      = aws_key_pair.my-key.key_name

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file(var.private_key)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "yum install httpd -y",
      "sudo amazon-linux-extras install php8.0 -y",
      "service httpd start",
      "service httpd status",
      "sudo bash -c 'echo Welcome to MY WEBPAGE > /var/www/html/index.html'"
    ]
  }

  tags = {
    Name  = "Assignment2-EC2-${count.index + 1}"
    Batch = "5AM"
  }
}
