output "_region_" {
  value = var._region_
}

output "public_ip"{
	value = aws_instance.web_server.public_ip
}
