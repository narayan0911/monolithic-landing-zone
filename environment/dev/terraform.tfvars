rgs = {
  dev = {
    rg       = "rg-landingzone-dev"
    location = "eastus"
  }
}

vnets = {
  landingzone-vnet = {
    vnet          = "vnet-landingzone-dev"
    address_space = ["10.0.0.0/16"]
    location      = "eastus"
    rg            = "rg-landingzone-dev"
  }
}

subnets = {
  appgw = {
    subnet           = "subnet-appgw"
    rg               = "rg-landingzone-dev"
    vnet             = "vnet-landingzone-dev"
    address_prefixes = ["10.0.1.0/24"]
  }
  frontend = {
    subnet           = "subnet-frontend"
    rg               = "rg-landingzone-dev"
    vnet             = "vnet-landingzone-dev"
    address_prefixes = ["10.0.2.0/24"]
  }
  backend = {
    subnet           = "subnet-backend"
    rg               = "rg-landingzone-dev"
    vnet             = "vnet-landingzone-dev"
    address_prefixes = ["10.0.3.0/24"]
  }
  bastion = {
    subnet           = "AzureBastionSubnet"
    rg               = "rg-landingzone-dev"
    vnet             = "vnet-landingzone-dev"
    address_prefixes = ["10.0.4.0/27"]
  }
}

pips = {
  appgw-pip = {
    pip      = "appgw-pip"
    location = "eastus"
    rg       = "rg-landingzone-dev"
  }
  bastion-pip = {
    pip      = "bastion-pip"
    location = "eastus"
    rg       = "rg-landingzone-dev"
  }
}

nsgs = {
  frontend-nsg = {
    nsg      = "nsg-frontend"
    location = "eastus"
    rg       = "rg-landingzone-dev"
    nic      = "frontend-nic"
  }
  backend-nsg = {
    nsg      = "nsg-backend"
    location = "eastus"
    rg       = "rg-landingzone-dev"
    nic      = "backend-nic"
  }
}

kvs = {
  landingzone-kv = {
    kv       = "kv-landingzone-dev"
    location = "eastus"
    rg       = "rg-landingzone-dev"
  }
}

bastions = {
  console-bastion = {
    bastion        = "bastion-landingzone-dev"
    location       = "eastus"
    rg             = "rg-landingzone-dev"
    pip            = "bastion-pip"
    vnet           = "vnet-landingzone-dev"
    subnet         = "AzureBastionSubnet"
    ip_config_name = "bastion-ipconfig"
  }
}

appgws = {
  landingzone-appgw = {
    appgw                      = "appgw-landingzone-dev"
    location                   = "eastus"
    rg                         = "rg-landingzone-dev"
    subnet                     = "subnet-appgw"
    vnet                       = "vnet-landingzone-dev"
    frontend_public_ip         = "appgw-pip"
    frontend_ip_name           = "appgw-frontend-ip"
    frontend_port              = 80
    backend_pool_name          = "appgw-backend-pool"
    backend_http_settings_name = "appgw-http-settings"
    backend_port               = 80
    backend_addresses = [
      {
        ip_address = "10.0.2.4"
              }
    ]
    http_listener_name        = "appgw-http-listener"
    request_routing_rule_name = "appgw-routing-rule"
    protocol                  = "Http"
    cookie_based_affinity     = "Disabled"
  }
}

vms = {
  frontend-vm = {
    vm             = "vm-frontend"
    location       = "eastus"
    rg             = "rg-landingzone-dev"
    size           = "Standard_D2als_v7"
    admin_username = "azureuser"
    nic            = "frontend-nic"
    ip_config_name = "ipconfig-frontend"
    subnet         = "subnet-frontend"
    vnet           = "vnet-landingzone-dev"
   publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
    password_secret_name = "vmpassword"
    kv             = "kv-landingzone-dev"
  }
  backend-vm = {
    vm             = "vm-backend"
    location       = "eastus"
    rg             = "rg-landingzone-dev"
    size           = "Standard_D2als_v7"
    admin_username = "azureuser"
    nic            = "backend-nic"
    ip_config_name = "ipconfig-backend"
    subnet         = "subnet-backend"
    vnet           = "vnet-landingzone-dev"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
    password_secret_name = "vmpassword"
    kv             = "kv-landingzone-dev"
  }
}
