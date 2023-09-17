resource "aws_lightsail_instance" "webserver" {
  name              = "terraform-lightsail-instance"
  availability_zone = "us-east-1" # Adjust this if you changed the region
  blueprint_id      = "amazon_linux_2"  # Using Amazon Linux 2 as the OS
  bundle_id         = "nano_2_0"  # Using the smallest available instance size

  user_data = <<-EOT
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform </h1>" > /var/www/html/index.html
              EOT
}
