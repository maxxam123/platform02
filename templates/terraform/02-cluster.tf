resource "aws_instance" "ins_nihao" {
  ami = "ami-01e444924a2233b07"
  instance_type = "t2.micro"
  subnet_id = "subnet-00e39a3f15e5c70f7"
  tags = {
    Name = "Ins nihao"
  }
}
