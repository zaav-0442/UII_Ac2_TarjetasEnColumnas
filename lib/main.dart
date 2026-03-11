import 'package:flutter/material.dart';

// 1. Definición de la clase Producto
class Producto {
  final String titulo;
  final String subtitulo;
  final String imgUrl;

  Producto({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
  });
}

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de diccionarios (Maps) convertida a objetos de la clase Producto
    final List<Map<String, String>> datosCrudos = [
      {
        'titulo': 'Cámara Vintage',
        'subtitulo': 'Captura momentos clásicos',
        'imgUrl': 'https://picsum.photos/id/250/200/200'
      },
      {
        'titulo': 'Café Orgánico',
        'subtitulo': 'El mejor aroma de la mañana',
        'imgUrl': 'https://picsum.photos/id/425/200/200'
      },
      {
        'titulo': 'Laptop Pro',
        'subtitulo': 'Potencia para tus proyectos',
        'imgUrl': 'https://picsum.photos/id/1/200/200'
      },
    ];

    // Transformamos el diccionario en una lista de objetos Producto
    final List<Producto> productos = datosCrudos
        .map((item) => Producto(
              titulo: item['titulo']!,
              subtitulo: item['subtitulo']!,
              imgUrl: item['imgUrl']!,
            ))
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // Gris muy claro de fondo
        appBar: AppBar(
          title: const Text('Mis Productos'),
          backgroundColor: const Color.fromARGB(255, 228, 195, 214), // Misty Rose (Pastel)
          foregroundColor: const Color.fromARGB(221, 255, 255, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // Usamos una Columna para tus 3 filas
          child: Column(
            children: productos.map((p) => TarjetaProducto(producto: p)).toList(),
          ),
        ),
      ),
    );
  }
}

// Widget personalizado para la Tarjeta
class TarjetaProducto extends StatelessWidget {
  final Producto producto;

  const TarjetaProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Sombreado
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 20),
      color: const Color(0xFFB2EBF2), // Cian claro (Pastel)
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Imagen de la red con bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                producto.imgUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20), // Espacio entre imagen y texto
            // Columna derecha con 2 filas (título y subtítulo)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 126, 145, 108), // Verde oliva suave
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    producto.subtitulo,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}