provider "aws" {
  profile = "default"
  region = "us-east-1"
  
}

resource "aws_instance" "first_instance"{
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "DareyNext"
    security_groups = ["launch-wizard-1"]
    
    tags = {
        Name = "UgosInstance"
    }
}

resource "aws_ami_from_instance" "first_ami" {
  name = "my-ami"
  source_instance_id = aws_instance.first_instance.id
  tags = {
    Name = "my-ami"
  }
  
}