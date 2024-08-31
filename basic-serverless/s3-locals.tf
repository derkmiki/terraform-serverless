locals {
  name = "${var.department}-${var.environment}"
  tags = {
    deparment   = var.department
    environment = var.environment
  }
  function_name = "${local.name}-hello-world"
}
