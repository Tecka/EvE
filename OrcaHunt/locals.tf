locals {
  rg_name   = "RG-${var.project}-01-${var.env}"
  data_name = lower(join("", ["STA${var.project}", random_string.sta02.result, "02${var.env}"]))
  kva_name  = join("", ["KVA-${var.project}-", random_string.azf01.result, "-01-${var.env}"])
  asp_name  = join("", ["ASP-${var.project}-", random_string.azf01.result, "-01-${var.env}"])
  azf_name  = join("", ["AZF-${var.project}-", random_string.azf01.result, "-01-${var.env}"])
}

