output "public-ip"{
    value=aws_spot_instance_request.elk[each.value["name"]]
}