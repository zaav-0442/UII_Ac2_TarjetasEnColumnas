import 'package:flutter/material.dart';

void main() {
  runApp(const FreddysApp());
}

class FreddysApp extends StatelessWidget {
  const FreddysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const PagoEntregaScreen(),
    );
  }
}

class PagoEntregaScreen extends StatelessWidget {
  const PagoEntregaScreen({super.key});

  // Estilo común para los contenedores de input y botones
  final double widthContainer = 0.8; // 80% del ancho de la pantalla
  final double heightInputs = 35.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = screenWidth * widthContainer;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                // --- FILA 1: Header (Logo y Hamburguesa) ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.fastfood, color: Colors.orange, size: 30),
                        SizedBox(width: 8),
                        Text(
                          "Freddy's",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  ],
                ),
                const SizedBox(height: 20),

                // --- FILA 2: Regresar y Título ---
                Row(
                  children: [
                    const Icon(Icons.arrow_back, size: 28),
                    Expanded(
                      child: Center(
                        child: Text(
                          "PAGO Y ENTREGA",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 28), // Espacio para equilibrar el centro
                  ],
                ),
                const SizedBox(height: 30),

                // --- FILA 3: Espacio para Imagen (1/3 de pantalla aprox) ---
                Container(
                  width: targetWidth,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://raw.githubusercontent.com/zaav-0442/Act15_Examen/main/pantalla2/mapa.jpg",
                      fit: BoxFit.cover, // Ajusta la imagen para cubrir el contenedor
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator()); // Muestra carga
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error, color: Colors.red)); // Muestra error
                      },
                    ),
                  ),
                ),

                // --- FILA 4: Botón Elegir Ubicación ---
                SizedBox(
                  width: targetWidth * 0.9,
                  height: heightInputs,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[700],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Elegir Ubicación", style: TextStyle(color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 60), // Espacio considerable solicitado

                // --- FILA 5: Input Tarjeta de Crédito ---
                _buildInputSection(targetWidth, Icons.credit_card),
                const SizedBox(height: 15),

                // --- FILA 6: Inputs divididos (Fecha y Candado) ---
                SizedBox(
                  width: targetWidth,
                  child: Row(
                    children: [
                      Expanded(child: _buildInputSection(double.infinity, Icons.calendar_today)),
                      const SizedBox(width: 15),
                      Expanded(child: _buildInputSection(double.infinity, Icons.lock_outline)),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // --- FILA 7: Input Persona ---
                _buildInputSection(targetWidth, Icons.person_outline),
                const SizedBox(height: 40),

                // --- FILA 8: Botón Siguiente (Extremo derecho) ---
                Container(
                  width: targetWidth, // Esto asegura que el "límite" sea el mismo que los inputs
                  alignment: Alignment.centerRight, // Empuja el contenido (el botón) a la derecha de este contenedor
                  child: SizedBox(
                    width: 140,
                    height: heightInputs,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Navegando al siguiente paso...");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Siguiente", style: TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para crear los campos de input con ícono lateral
  Widget _buildInputSection(double width, IconData icon) {
    return Container(
      width: width,
      height: heightInputs,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(right: BorderSide(color: Colors.grey[400]!)),
            ),
            child: Icon(icon, color: Colors.grey[600]),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
