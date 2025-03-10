
resource "aws_security_group" "webserver_access" {
        name = "webserver_access"
        description = "allow ssh and http"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }


}

resource "aws_instance" "ourfirst" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  availability_zone      = "us-east-1a"
  instance_type          = "t2.micro"
  user_data              = filebase64("install_ansible.sh")
  vpc_security_group_ids = [aws_security_group.webserver_access.name]  # Correct reference
  key_name               = "terraform-kp"
  
  tags = {
    Name      = "ec2-terraform"
    Location  = "Virginia"
  }
}

output "ec2_public_ip" {
  value = aws_instance.ourfirst.public_ip
  description = "Public IP of the EC2 instance"
}
