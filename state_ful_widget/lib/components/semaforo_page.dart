import 'package:flutter/material.dart';

class SemaforoPage extends StatefulWidget {
  const SemaforoPage({super.key});

  @override
  State<SemaforoPage> createState() => _SemaforoPageState();
}

class _SemaforoPageState extends State<SemaforoPage> {
  int _currentLight = 0; // Almacenamos el estado actual de la luz

  void _changeLight() {
    setState(() { // Uso de setState
      _currentLight = (_currentLight + 1) % 3; // Alternar en 0,1,2
    });
  }

  Color _getLightColor(int lightIndex) {
    if (lightIndex == _currentLight) {
      if (lightIndex == 0) return Colors.red;
      if (lightIndex == 1) return Colors.yellow;
      if (lightIndex == 2) return Colors.green;
    }
    return Colors.grey[400]!; // si indice de la Luz no es igual al de un  color se pone gris 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Semáforo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildLight(_getLightColor(0)),
                  _buildLight(_getLightColor(1)),
                  _buildLight(_getLightColor(2)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeLight,
              child: const Text("Cambiar Luz"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLight(Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
