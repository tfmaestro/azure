## Moduł lb

### Usuń publiczny dostęp do maszyn wirtualnych

Zanim przejdziesz do utworzenia load balancera, musisz upewnić się, ze Twoje maszyny wirtualne sa dostępne tylko wewnętrznie.
By to osiągnąć wystarczy zakomentować lub usunąć `public_ip_address_id` w `modules/vm/main.tf`.
Przykład:
```
  ip_configuration {
    name                          = "${each.key}-ip-config"
    subnet_id                     = data.azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "Dynamic"

    # public_ip_address_id = azurerm_public_ip.public_ip[each.key].id
  }
```
Wykonaj deploy maszyn wirtualnych po tej zmianie.

```
terraform apply
```
Przenieś się do foleru `envs/prod/lb` i wykonaj deploy load balancera.

Zainicjuj Terraforma
```
terraform init
```

Wykonać deploy
```
terraform apply
```
