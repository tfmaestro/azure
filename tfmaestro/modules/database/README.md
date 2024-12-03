## Moduł database

### Skonfiguruj zmienne środowiskowe

Ustaw w terminalu wartości dla `admin_password` i `mysql_user_password`

```
export TF_VAR_mysql_admin_password="<hasło>"
export TF_VAR_mysql_mysql_user_password="<hasło>"
```

### Skonfiguruj firewall
Dodaj adresy IP maszyn wirtualnych, które mają mieć dostęp do bazy w `envs/prod/database/terraform.tfvars`. Opcjonalnie możesz dodać `allow-ssh` wraz ze swoim adresem IP, aby mieć bezpośredni dostęp do maszyny, ale wtedy musisz także zainstalować sobie `mysql` lokalnie, by móc się połączyć z bazą.

```
firewall_rules = {
  "allow-vpn" = {
    start_ip_address = "<TWÓJ_IP>"
    end_ip_address   = "<TWÓJ_IP>"
  }
  "allow-server-public" = {
    start_ip_address = "<PUBLICZNE_IP_VM>"
    end_ip_address   = "<PUBLICZNE_IP_VM>"
  }
  "allow-server-private" = {
    start_ip_address = "<PRYWATNE_IP_VM>"
    end_ip_address   = "<PRYWATNE_IP_VM>"
  }
}
```

Zainicjuj Terraforma
```
terraform init
```

Wykonaj deploy
```
terraform apply
```

Wylistuj instancję bazy danych
```
az mysql flexible-server list --output table
```
