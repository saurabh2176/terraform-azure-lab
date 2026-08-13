module "resource_group" {
  source = "../../child-module/azurerm_resource_group"
  rgss   = var.rgss1
}

module "virtual-network" {
  depends_on = [module.resource_group]
  source     = "../../child-module/azurerm_virtual_network"
  vnet1      = var.vnet2

}

module "subnet" {
  depends_on = [module.virtual-network]
  source     = "../../child-module/azurerm_subnet"
  subnet1    = var.subnet2
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child-module/azurerm_public_ip"
  publicip1  = var.publicip2
}

module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../child-module/azurerm_network_interface"
  nic1       = var.nic2
}

module "virtual_machine" {
  depends_on = [module.network_interface]
  source     = "../../child-module/azurerm_virtual_machine"
  vm1        = var.vm2
}