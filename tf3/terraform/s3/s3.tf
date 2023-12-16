resource "aws_s3_bucket" "primer_bucket" {
  bucket = "${var.nombre}-${var.env}"
  tags = {
    Name        = "demo"
    Environment = "dev"
    Owner       = "Terraform"
  }
}