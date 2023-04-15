output "public-ip"{
    value=aws_spot_instance_request.elk[0].public_ip
}