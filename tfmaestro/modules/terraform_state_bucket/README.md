# Moduł terraform_state_bucket

## Ustaw unikalną nazwę

Ustaw unikalną nazwę dla nazwy bucketa. Każdy bucket w chmurze Azure musi posiadać unikalną nazwę w skali całej chmury. Oznacza to, że nie możesz wykorzystać tej samej nazwy, jaka jest podana w kursie. Dodaj np. ciąg cyfr/liter na końcu nazwy "tfstateenv${var.environment}" czyli "tfstateenv${var.environment}9w83r9wyf98wyf9". 

Nazwę ustaw w modules/terraform_state_bucket/main.tf. 
Zwróć uwagę, że w przypadku nazwy w chmurze Azure nie możemy wykorzystywać dodatkowych znaków takich jak np. “_” czy “-”. 

```
resource "azurerm_storage_account" "tfstate" {
  name                            = "tfstateenv${var.environment}" <- Tutaj zmień nazwę
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = var.environment
    purpose     = "terraform-state"
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

Na tym etapie zostały utworzone 2 buckety dla plików stanu i logów.

Wylistuj sobie utworzone buckety i skopiuj ID dla bucketu pod plik stanu.
Będzie on potrzebny przy migracji w następnym kroku.
```
aws s3 ls
```
