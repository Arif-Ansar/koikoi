module "resource_group" {
  source              = "../module/resource_group"
  resource_group_name = "vikks1"
  location            = "centralindia"
}
module "resource_group1" {
  source              = "../module/resource_group"
  resource_group_name = "vikks2"
  location            = "centralindia"
}
module "resource_group3" {
  source              = "../module/resource_group"
  resource_group_name = "rkha"
  location            = "centralindia"
}
module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../module/virtual_network"
  virtual_network_name     = "vnet1"
  virtual_network_location = "centralindia"
  resource_group_name      = "vikks1"
  address_space            = ["10.0.0.0/16"]

}
module "subnet" {
  depends_on           = [module.virtual_network]
  source               = "../module/subnet"
  subnet_name          = "frontend_subnet"
  resource_group_name  = "vikks1"
  virtual_network_name = "vnet1"
  address_prefixes     = ["10.0.1.0/24"]
}
module "subnet1" {
  depends_on           = [module.virtual_network]
  source               = "../module/subnet"
  subnet_name          = "backend_subnet"
  resource_group_name  = "vikks1"
  virtual_network_name = "vnet1"
  address_prefixes     = ["10.0.2.0/24"]
}







