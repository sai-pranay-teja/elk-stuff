output "public-ip"{
    value=aws_spot_instance_request.elk["ELK"].public_ip
}