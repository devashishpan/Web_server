
resource "aws_instance" "web_server"{
	ami = "ami-010aff33ed5991201"
	instance_type = "t2.micro"
	security_groups = ["web_server"]
	key_name = var._keyname_
	tags = {
		Name = "Webserver"
	}
}

resource "null_resource" "config_webserver" {
	connection {
		type = "ssh"
		user = "root"
		private_key = file(var._key_file_)
		host = aws_instance.web_server.public_ip
	}
	provisioner "remote-exec" {
		inline = [
			"sudo yum install httpd php -y",
			"sudo systemctl enable httpd",
			"sudo systemctl start httpd",
			"sudo yum install git -y",
			"sudo git clone ${var._git_url_} > /var/www/html"
		]
	}
	provisioner "local-exec"{
		command = "chrome ${aws_instance.web_server.public_ip}"
	}
}

