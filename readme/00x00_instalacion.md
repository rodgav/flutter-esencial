# Flutter esencial

¡Aprende a crear aplicaciones móviles increíbles con Flutter!




## Instalar FVM en windows
Con PowerShell, debe asegurarse de que Get-ExecutionPolicy no esté restringido. Sugerimos usar esta Bypassopción para omitir la política y así poder instalar elementos o AllSignedpara mayor seguridad.

Ejecutar `Get-ExecutionPolicy`

Si devuelve Restricted, entonces ejecutar `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.

Ahora ejecute el siguiente comando:
`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`

Instale FVM
`choco install fvm`


## Instalar FVM MacOS
[FVM](https://fvm.app/es/)
* `brew tap leoafarias/fvm`
* `brew install fvm`

### Desinstalar FVM MacOS
* `brew uninstall fvm`
* `brew untap leoafarias/fvm`

## Instalar Brew MacOS
[Brew](https://brew.sh/)
* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Documentación de Flutter 
[Flutter Docs](https://docs.flutter.dev/)

## Paquetes de Dart y Flutter
[Pub dev](https://pub.dev/)

### Otros paquetes
[Flutter Gems](https://fluttergems.dev/)