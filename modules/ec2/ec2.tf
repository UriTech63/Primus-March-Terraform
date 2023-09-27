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
   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCowWVh9HGylm7sJgt4S3/ssCDdH4n6XXrHBBWbB/oIO/8U/J61Mun0w7i45hSNKyilUunM3yXY9tVvU5QUEDaTdUNuqIrQC4WuFFT5l7sQ2yMqsaInINU8R3Bzlf0oslO8Es+NvsN+7JpRZ9tu3YCA7Qjzrs5t7/Vrq/0QB62xSX/w8v8GWi5yenXOpzy9BdCzLdDphs6Iz7Zf1Nx64BwIoJHnxOylUP0Z67kvkNGBOHxEhTgm7TzohFlAHLSthh132dEOyyDNGtTx8Zm16j1XwZK+1H9jM8p8Pw2qFKaUbhl3yTczBCmpjd+meslA17B2DK4bVU3+xeTydAuFQgPlD2Wj5v59TlLUjENMVDR725B9qlM9URuLQ8e5ixTrLQdYkLrkRBB8W6hFV4fnfw4me1feSb3fG9Q4CmqpOj/b35oLVxNUAxyVJi+nSjb55FD59hMTxtscjR1oviJkWv6rGywcYuFdW0hAnE2N+4ZfrV+BEFPVFo7Pom13A43t4fk="
  # public_key = file("~/.ssh/id_rsa.pub")
  
}

