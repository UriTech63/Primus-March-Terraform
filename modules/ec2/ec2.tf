data "aws_ami" "amzn-linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "primus-server" {
  ami           = data.aws_ami.amzn-linux2.id
  instance_type = var.instancetype #"t2.micro"
   key_name      = aws_key_pair.test-key.key_name     # "terrafrom-key"
  subnet_id                   =  var.subnetId       # aws_subnet.primus-aws_subnet.id
  vpc_security_group_ids      = [var.sg]         # [aws_security_group.primus-sg.id]
  user_data = file(var.user-data)
  # user_data                   = file ("shellscript.sh")
  user_data_replace_on_change = true
  # count = var.tags [count.index]


  tags = {
    Name = "Primus-1"
  }


}

resource "aws_key_pair" "test-key" {
  key_name = "test-key"
   public_key = file("~/.ssh/id_rsa.pub")
  
}

