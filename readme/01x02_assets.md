# [Flutter esencial](../readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## 1. Assets

Fragmento de código de una interfaz de usuario.

Veamos los mas basicos.

config

```yaml
flutter:
  ...
  assets:
    - assets/images/image.png
```

Ejemplo de una image
```dart
   Image.asset(
          'assets/images/image.png',
          width: 300,
          height: 300,
        ),
```