provider "aws"{
    region = "us-east-1"
}

resource "aws_spot_instance_request" "elk" {
    for_each      = var.ansible-practise
    ami           = "ami-0bb6af715826253bf"
    instance_type = each.value["type"]
    spot_type     = "persistent"
    instance_interruption_behavior = "stop"
    wait_for_fulfillment=true

    vpc_security_group_ids = ["sg-036e9bfb37a180657"]
    tags = {
      Name = each.value["name"]
    }

    timeouts {
    create = "10m"
    delete = "10m"
  }

}


resource "null_resource" "connection" {
  provisioner "remote-exec" {
  connection {
    host = aws_spot_instance_request.elk[*].public_ip
    user = "centos"
    password = "DevOps321"
  }

  inline = [
    "sudo labauto ansible"
  ]
  
}
  
}