# [Flutter esencial](../readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## 4. Scrolls
Veremos `SingleChildScrollView`, `ListView`, `ListView.builder`, 

### 4.1 SingleChildScrollView

Ya vimos `Column` y `Row`, pero que pasa cuando este excede el tamaño de nuestro pantalla

 `Column` excede el tamaño de nuestra pantalla
```dart
   Column(
      children: [
        Container(
            width: 200,
            height: 200,
            color: Colors.red,
        ),
        Container(
            width: 200,
            height: 200,
            color: Colors.amber,
        ),
        Container(
            width: 200,
            height: 200,
            color: Colors.blue,
        ),
        ...
      ],
    )
```
Entonces envolvemos nuestra  `Column` o `Row` con una `SingleChildScrollView`

```
SingleChildScrollView(
      child: Column(...))
```      

### 4.2 ListView

Ejemplo de un `ListView`
```dart
   ListView(
      children: [
        Container(
            width: 200,
            height: 200,
            color: Colors.red,
        ),
        Container(
            width: 200,
            height: 200,
            color: Colors.amber,
        ),
        Container(
            width: 200,
            height: 200,
            color: Colors.blue,
        ),
        ...
      ],
    )
```

Ejemplo de un `ListView.builder`

```dart
    ListView.builder(
        itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 100, height: 100,color: Colors.primaries[Random()
                .nextInt(Colors.primaries.length)],);
        },
        itemCount: 100,
    )
```

Ejemplo de un `GridView`
```dart
GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    )
```

Ejemplo de un `GridView.count`
```dart
GridView.count(
    crossAxisCount: 3,
    children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    )
```

Ejemplo de un `GridView.builder`
```dart
GridView.builder(
    ...
    itemBuilder: (BuildContext context, int index) {
        return Container(color: Colors.primaries[Random()
            .nextInt(Colors.primaries.length)],);
      },
    itemCount: 100,
)
```

Ejemplo de un `GridView.custom`
```dart
GridView.custom(
    gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    childrenDelegate: SliverChildBuilderDelegate((context, index) =>
        Container(color: Colors.primaries[Random()
            .nextInt(Colors.primaries.length)],)),
)
```

Ejemplo de un `GridView.extent`
```dart
GridView.extent(
      maxCrossAxisExtent: 200,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    )
```