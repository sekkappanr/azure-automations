locals {
      no_of_lb = var.create_individual_lb ? var.number_of_servers + 1 : 1
}