## Moduł vm

### Dodaj swój klucz publichny SSH

Swtórz nowy plik `<nazwa_key>.pub` w modules/vm/ssh/ i dodaj w nim swój klucz publichny SSH na wzór kluczy w pliku np. `modules/vm/ssh/kasia_key.pub`.

Przykładowy wygląd klucza:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOxfeZ5MQG
```

Następnie dodaj w `modules/vm/main.tf` ściezkę do nowego pliku z kluczem, a takze dostosuj nazewnictwo w miejscach wskazanych ponizej.

```
resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vm_config
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = each.value.machine_type
  admin_username      = "kasia" <- TUTAJ ZMIEŃ
  admin_ssh_key {
    username   = "kasia" <- TUTAJ ZMIEŃ
    public_key = file("${path.module}/ssh/kasia_key.pub") <- TUTAJ ZMIEŃ
  }
```

### Dodaj swój adres IP

W regule `allow-ssh-vpn` zdefiniowanej w `envs/prod/vm/terraform.tfvars` dodaj swój stały adres IP.
Moze być to równiez adres IP VPNa jeśli posiadasz stały.
Jest to niezbędne, aby mozna było zalogować się do utworzonych maszyn po protokole SSH.

```
  "allow-ssh-vpn" = {
    protocol              = "Tcp"
    ports                 = ["22"]
    priority              = 101
    description           = "Allow ssh communication via VPN."
    source_address_prefix = ["<TWOJE_IP>/32"]
  }
```

Zainicjuj Terraforma
```
terraform init
```

Wykonać deploy
```
terraform apply
```

Wylistuj maszyny wirtualne
```
az vm list --output table
```
