# [Flutter esencial](../readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## 1. ¿Que es un widget?

Fragmento de código de una interfaz de usuario.

Veamos los mas basicos.

Ejemplo de una Text
```dart
   Text("Este es un widget de texto")
```

Ejemplo de una Container
```dart
   Container(
      color: Colors.blue,
      width: 100,
      height: 100,
    )
```

Ejemplo de una SizedBox
```dart
    SizedBox(
      width: 100,
      height: 100,
    )
```

Ejemplo de una ElevatedButton
```dart
    ElevatedButton(
      onPressed: () {
        //acción de usuario
      },
      child: const Text("Este es un boton"))
```

Ejemplo de una GestureDetector
```dart
    GestureDetector(
      onTap: () {
         //acción de usuario
      },
      child: const FlutterLogo(),
    )
```

Ejemplo de una InkWell
```dart
    InkWell(
      onTap: () {
         //acción de usuario
      },
      child: const FlutterLogo(),
    )
```


Podemos tener la lista de widgets que tenemos en flutter en [Widgets Flutter](https://docs.flutter.dev/ui/widgets)