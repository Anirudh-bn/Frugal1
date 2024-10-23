import 'package:flutter/material.dart';

class TemperatureUnitPage extends StatelessWidget {
  final String title;
  final String definition;

  const TemperatureUnitPage({
    required this.title,
    required this.definition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Text(
                definition,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Common reference temperatures section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Common Reference Points:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getReferencePoints(title),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A6DA),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getReferencePoints(String scale) {
    switch (scale) {
      case 'Celsius (°C)':
        return '• Water freezing: 0°C\n'
            '• Room temperature: ~20-25°C\n'
            '• Body temperature: 37°C\n'
            '• Water boiling: 100°C';
      case 'Fahrenheit (°F)':
        return '• Water freezing: 32°F\n'
            '• Room temperature: ~68-77°F\n'
            '• Body temperature: 98.6°F\n'
            '• Water boiling: 212°F';
      case 'Kelvin (K)':
        return '• Absolute zero: 0K\n'
            '• Water freezing: 273.15K\n'
            '• Room temperature: ~293-298K\n'
            '• Water boiling: 373.15K';
      default:
        return '';
    }
  }
}
