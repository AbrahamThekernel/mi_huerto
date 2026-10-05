import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HuertoPage());
  }
}

class HuertoPage extends StatefulWidget {
  const HuertoPage({super.key});

  @override
  State<StatefulWidget> createState() => _HuertoPageState();
}

class _HuertoPageState extends State<HuertoPage> {
  final controller = TextEditingController();
  final List<String> cultivos = [];

  void agregarCultivos() {
    final texto = controller.text.trim();
    if (texto.isEmpty) return;
    setState(() {
      cultivos.add(texto);
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Huerto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Agregar cultivo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: agregarCultivos,
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cultivos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.eco),
                    title: Text(cultivos[index]),
                  );
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}
