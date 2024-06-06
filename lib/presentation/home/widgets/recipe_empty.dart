import 'package:flutter/material.dart';

class RecipeEmpty extends StatelessWidget {
  const RecipeEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/empty.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              'No hay recetas disponibles en este momento. Por favor, vuelve más tarde o prueba con otra búsqueda.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
