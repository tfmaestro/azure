# Moduł Bucket

## Ustaw unikalną nazwę dla Blob Storage

Ustaw unikalną nazwę dla nazwy bucketa. Każdy bucket w chmurze Azure musi posiadać unikalną nazwę w skali całej chmury. Oznacza to, że nie możesz wykorzystać tej samej nazwy, jaka jest podana w kursie. Dodaj np. ciąg cyfr/liter na końcu nazwy "tfmaestromaintenance" czyli "tfmaestromaintenance9w83r9wyf98wyf9".  W przypadku Azure nazwa nie może też zawierać dodatkowych znaków takich jak np. - lub _. Nazwę ustaw w `envs/prod/static-site.tf`
Nazwe ustaw w `envs/prod/static_site.tf`

```
module "bucket" {
  source              = "../../modules/bucket"
  name                = "tfmaestromaintenance" <- Zmień tutaj
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  main_page_suffix    = "index.html"
  not_found_page      = "404.html"
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

## Migracja plików stanu

Przejdź do `envs/prod/backend.tf` i dodaj tam nazwę swojego nowego bucketa. 

```
terraform {
    backend "azurerm" {
        resource_group_name = "prod-rg"
        storage_account_name = "tfstateenvprod" <- Tutaj zmień nazwę
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}
```

Przejdź do folderu prod i zainicjuj Terraforma, aby wykonać migrację pliku stanu.
```
terraform init
```

Tą samą czynność wykonaj dla środowiska dev.
