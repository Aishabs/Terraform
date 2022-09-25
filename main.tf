provider "aws" { 
  region = "us-east-1" 

} 
    
resource "aws_instance" "my-instance" { 
  ami = "ami-1222f774911c1g690" 
  instance_type = "t2.micro" 
  vpc_security_group_ids = [aws_security_group.sg.id] 

  user_data = file("install.sh") 
  tags = { 
    Name = "MyEc2" 
  } 
} 
resource "aws_security_group" "sg" { 
  ingress { 
    from_port = 80 
    protocol = "tcp" 
    to_port = 80 
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress { 
    from_port = 22 
    protocol = "tcp" 
    to_port = 22 
    cidr_blocks = ["50.60.139.84/32"] 
  } 
  egress{ 
    from_port = 0 
    protocol = "-1" 
    to_port = 0 
    cidr_blocks = ["0.0.0.0/0"] 
  } 
}