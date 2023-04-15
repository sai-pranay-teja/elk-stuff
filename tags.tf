resource "aws_ec2_tag" "spot_instance_tags" {
    for_each = var.ansible-practise
    resource_id = aws_spot_instance_request.elk[each.key].spot_instance_id
    key         = "Name"
    value       = each.value["name"]
}