# [Flutter esencial](../readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## 5. Stateless y Stateful

Un Widget puede tener o no tener estado. Aqui aparecen los widgets  `StatelessWidget` y  `StatefulWidget`

### ¿Pero que significa tener estado?

Un estado es un antes y despues de una interaccion de usuario.

En simples palabras podriamos decir que si un widget cambia su apariencia, comportamiento despues de una interaccion por parte del usuario este seria un `StatefulWidget`.

### Ejemplo de un StatelessWidget

```dart
class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

### Ejemplo de un StatefulWidget

```dart
class ExampleStateful extends StatefulWidget {
  const ExampleStateful({super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

### Veamoslos en acción

1. Creamos una carpeta en `lib/` llamada `01x01_stateless_stateful`.
2. Creamos un archivo llamado `example_stateless.dart`

    ```dart
    import 'package:flutter/material.dart';
    
    class ExampleStateless extends StatelessWidget {
      const ExampleStateless({super.key});
    
      @override
      Widget build(BuildContext context) {
        return const Scaffold(
          body: Center(
            child: FlutterLogo(),
          ),
        );
      }
    }
    ```

3. Creamos un archivo `example_stateful.dart`

   ```dart
    import 'package:flutter/material.dart';
    
    class ExampleStateful extends StatefulWidget {
      const ExampleStateful({super.key});
    
      @override
      State<ExampleStateful> createState() => _ExampleStatefulState();
    }
    
    class _ExampleStatefulState extends State<ExampleStateful> {
      @override
      Widget build(BuildContext context) {
        return const Scaffold(
          body: Center(
            child: FlutterLogo(),
          ),
        );
      }
    }
    ```

4. En nuestro `main.dart` en nuestro `MaterialApp` en el parametro `home:` alternamos entre `ExampleStateless` y `ExampleStateful`. y ejecutamos la aplicación.

    Veremos que ambas son iguales. Pero uno tiene un estado y el otra no.
    ¿Y como usamos y/o modificamos su estado? vamos a ello.

5. En nuestro `ExampleStateful` haremos que un elemento incremente y decremente su valor dependiendo del botton que se presione.
    - En nuestro `_ExampleStatefulState` agregamos

    ```dart
    late int _count;

    @override
    void initState() {
        _count = 0;
        super.initState();
    }
    ```

    - En nuestro `Scaffold` parametro `body:`

    ```dart
    Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                IconButton(
                    onPressed: () {
                    _count++;
                    setState(() {});
                    },
                    icon: const Icon(Icons.add)),
                Text(_count.toString()),
                IconButton(
                    onPressed: () {
                    _count--;
                    setState(() {});
                    },
                    icon: const Icon(Icons.remove)),
            ],
            ),
            ElevatedButton(
                onPressed: () {
                _count = 0;
                setState(() {});
                },
                child: const Text('Reset Value'))
        ],
        )
    ```
