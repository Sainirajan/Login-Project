provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}

resource "aws_instance" "flask_app" {
  ami           = "ami-08d4ac5b634553e16"  # Amazon Linux 2 AMI (for example)
  instance_type = "t2.micro"

  # Ensure that security groups allow traffic
  vpc_security_group_ids = [aws_security_group.flask_sg.id]

  # Install Docker and run your Flask app container on EC2
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user

    # Log in to Docker and pull your Flask image
    sudo docker pull Niranjan18/flask-web-app

    # Run the Docker container
    sudo docker run -d -p 80:5000 Niranjan18/flask-web-app
  EOF

  key_name = "loginproject"  # Replace with your EC2 key pair

  tags = {
    Name = "FlaskAppServer"
  }
}

# Security group to allow inbound HTTP traffic and SSH access
resource "aws_security_group" "flask_sg" {
  name        = "flask_sg"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
