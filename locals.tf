locals {
  location             = var.location
  rg_name              = "RG-${var.project}-01-${var.env}"
  remote_backends_name = lower(join("", ["STA${var.project}", random_string.sta01.result, "01${var.env}"]))
  data_name            = lower(join("", ["STA${var.project}", random_string.sta02.result, "02${var.env}"]))
}
