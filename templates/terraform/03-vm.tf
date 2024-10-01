resource "aws_instance" "VM" {
  ami = ""
  instance_type = "t2.micro"
  subnet_id = "subnet-00e39a3f15e5c70f7"
  tags = {
    Name = "VM"
  }
}
