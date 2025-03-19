# Terraform EC2 Instance and AMI Creation

For this project I automated the creation of an EC2 instance on AWS and then created an Amazon Machine Image (AMI) from the created instance.

### First Step

The first thing I did was create a project directory, within which I created main.tf. This file is where I placed the main set of configurations for my EC2 instance and ami. See the configuration below:

```
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
```

I validated that my resources were created on aws. First it was the EC2 instance:
![ec2success](./img/1%20ec2%20success.jpg)

I was also able to create a new ami from the instance I created.
![amisuccess](./img/2%20ami%20success.jpg)