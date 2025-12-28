# Terraform Module Template
variable "environment" {
  type        = string
  description = "Environment name"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  
  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

output "instance_id" {
  value = aws_instance.main.id
}
