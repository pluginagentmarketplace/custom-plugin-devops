# Infrastructure as Code Guide
## Terraform
```hcl
resource "aws_instance" "web" {
  ami           = "ami-xxx"
  instance_type = "t3.micro"
}
```
