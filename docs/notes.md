# Блог разработки

Файл для хранения кратких заметок, советов и документирования сложных моментов при разработке и развертывании инфраструктуры проекта. Содержит актуальную информацию о:
- Особенностях конфигурации Terraform
- Нюансах развертывания
- Решениях встреченных проблем
- Рекомендациях
---
### Пользователь для terraform
> [!NOTE]
> По соображениям безопасности для работы terraform необходим пользователь с ограниченным набором разрешений:
> - Datastore.AllocateSpace
> - Datastore.AllocateTemplate
> - Datastore.Audit
> - Pool.Allocate
> - Pool.Audit
> - Sys.Audit
> - Sys.Console
> - Sys.Modify
> - VM.Allocate
> - VM.Audit
> - VM.Clone
> - VM.Config.CDROM
> - VM.Config.Cloudinit
> - VM.Config.CPU
> - VM.Config.Disk
> - VM.Config.HWType
> - VM.Config.Memory
> - VM.Config.Network
> - VM.Config.Options
> - VM.Migrate
> - VM.PowerMgmt
> - SDN.Use
> 
> Опционально для работы с QEMU Guest Agent
> 
> - VM.GuestAgent.Audit
> - VM.GuestAgent.Unrestricted

### Проблема с правами доступа для terraform
> [!CAUTION]
> Для 9 версии PVE в отличии от 8 не требуется разрешение VM.Monitor, но по умолчанию провайдер его требует, из-за чего происходит ошибка на этапе проверки разрешений.

> [!TIP]
> Добавить параметр `pm_minimum_permission_check = false` в блок провайдера. Это позволит обойти проверку разрешений.<br>
> *Или*<br>
> Явно указать проверяемые разрешения через `pm_minimum_permission_list`.

### Использование образа с Cloud-init
> [!TIP]
> Поскольку проект подразумевает автоматизацию, то в качестве образа для всех ВМ будет использоватся облачная версия Альт Сервер 11  поддерживающая Cloud-init

### Импортирование образа qcow2
> [!NOTE]
> Появилась необходимость импортирования образа виртуальной машины .qcow2

> [!TIP]
> Скачать образ `wget <image-url>`
> Создать пустую ВМ `qm create 900`
> Установить диск с образом `qm set 900 --scsi0 local:0,import-from=<path-to-image>`
> Создать шаблон `qm template 900`