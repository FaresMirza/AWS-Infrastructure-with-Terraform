resource "aws_launch_template" "my_lt" {
  name_prefix   = "my-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.instance_sg_id]
  }

  user_data = base64encode(<<-EOF
  #!/bin/bash
  yum install -y git

  # Install Node.js (LTS version)
  
  yum install -y nodejs
  # Clone the repository
  cd /home/ec2-user
  git clone ${var.git_repo}
  cd Express

  # Install dependencies
  npm install

  # Start the Node.js app in the background
  nohup node index.js > app.log 2>&1 &

  EOF
  )

  key_name = var.key_pair

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "my-instance"
    }
  }
}

