import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller 1 Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Estado del título (requisito obligatorio)
  String _title = "Hola, Flutter";

  // Estado para color de caja (ejemplo de setState adicional)
  bool _cajaRoja = true;

  // Estado para mostrar/ocultar grid
  bool _mostrarGrid = true;

  // Cambia el título y muestra SnackBar (uso claro de setState)
  void _cambiarTitulo() {
    setState(() {
      _title = _title == "Hola, Flutter" ? "¡Título cambiado!" : "Hola, Flutter";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Título actualizado")),
    );
  }

  // Alterna color de la caja (otro uso de setState)
  void _toggleColorCaja() {
    setState(() {
      _cajaRoja = !_cajaRoja;
    });
  }

  // Alterna visibilidad del GridView
  void _toggleGrid() {
    setState(() {
      _mostrarGrid = !_mostrarGrid;
    });
  }

  // Muestra un SnackBar personalizado
  void _mostrarSnack(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          // ElevatedButton.icon adicional en AppBar (requisito: OutlinedButton / ElevatedButton.icon)
          IconButton(
            tooltip: "Alternar grid",
            onPressed: _toggleGrid,
            icon: const Icon(Icons.grid_view),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nombre del estudiante (centrado) + código
            Center(
              child: Text(
                "Alejandro Escandón\nCódigo: 123456",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            // Row con dos imágenes (Image.network y Image.asset)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.network con InkWell para efecto ripple y lógica al presionar
                InkWell(
                  onTap: () {
                    _mostrarSnack("Imagen de red presionada");
                  },
                  child: Image.network(
                    // URL de ejemplo (puedes cambiarla)
                    "https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png",
                    width: 100,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(width: 20),

                // Image.asset envuelta en InkWell para efecto
                InkWell(
                  onTap: () {
                    _mostrarSnack("Imagen local presionada");
                  },
                  child: Image.asset(
                    "assets/unnamed.jpg",
                    width: 100,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Botones: Cambiar título (obligatorio) y otros botones adicionales
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _cambiarTitulo,
                  child: const Text("Cambiar Título"),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    _toggleColorCaja();
                    _mostrarSnack("Color de la caja cambiado");
                  },
                  icon: const Icon(Icons.color_lens),
                  label: const Text("Cambiar color"),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => _mostrarSnack("OutlinedButton presionado"),
                  child: const Text("Acción"),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Stack: texto sobre imagen (uno de los widgets requeridos)
            SizedBox(
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Imagen de fondo (network para no depender únicamente de assets)
                  Positioned.fill(
                    child: Image.network(
                      "https://picsum.photos/600/200",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Stack: texto sobre imagen",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Container con borde y margen que contiene ListView (otro widget requerido)
            // Para que ListView funcione dentro de Column, lo ponemos dentro de Expanded
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.04),
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Text(
                        "Lista de ejemplos (toca un elemento)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 6),

                    // ListView con elementos interactivos
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: const Text("Elemento 1"),
                            subtitle: const Text("Información adicional 1"),
                            onTap: () => _mostrarSnack("Presionaste Elemento 1"),
                          ),
                          ListTile(
                            leading: const Icon(Icons.star),
                            title: const Text("Elemento 2"),
                            subtitle: const Text("Información adicional 2"),
                            onTap: () => _mostrarSnack("Presionaste Elemento 2"),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            title: const Text("Elemento 3"),
                            subtitle: const Text("Información adicional 3"),
                            onTap: () => _mostrarSnack("Presionaste Elemento 3"),
                          ),
                          ListTile(
                            leading: const Icon(Icons.map),
                            title: const Text("Elemento 4"),
                            subtitle: const Text("Información adicional 4"),
                            onTap: () => _mostrarSnack("Presionaste Elemento 4"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Caja que cambia de color con setState (efecto visual)
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.only(top: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _cajaRoja ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _cajaRoja ? "Caja Roja" : "Caja Verde",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8),

            // GridView (mínimo 4 celdas) - se oculta si _mostrarGrid == false
            if (_mostrarGrid)
              SizedBox(
                height: 120,
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () => _mostrarSnack("Grid item ${index + 1} presionado"),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue.shade50,
                        ),
                        child: Text("Cell ${index + 1}"),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
