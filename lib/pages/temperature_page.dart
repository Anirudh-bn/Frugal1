import 'package:flutter/material.dart';
import 'package:frugal1/pages/temperatureunitpage.dart';
import 'package:frugal1/widgets/temperature_unit_tile.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> temperatureUnits = [
      {
        'title': 'Celsius (°C)',
        'description': 'Most widely used temperature scale',
        'definition':
            'The Celsius scale is based on the freezing point of water (0°C) and its boiling point (100°C) at standard atmospheric pressure. It is the most widely used temperature scale in the world.\n\nConversion formulas:\nTo Fahrenheit: °F = (°C × 9/5) + 32\nTo Kelvin: K = °C + 273.15',
        'icon': Icons.thermostat,
      },
      {
        'title': 'Fahrenheit (°F)',
        'description': 'Common in the United States',
        'definition':
            'The Fahrenheit scale sets the freezing point of water at 32°F and its boiling point at 212°F. It is primarily used in the United States for everyday temperature measurements.\n\nConversion formulas:\nTo Celsius: °C = (°F - 32) × 5/9\nTo Kelvin: K = (°F - 32) × 5/9 + 273.15',
        'icon': Icons.device_thermostat,
      },
      {
        'title': 'Kelvin (K)',
        'description': 'Scientific absolute temperature scale',
        'definition':
            'The Kelvin scale is the SI base unit of temperature. It starts at absolute zero (0K), the theoretical lowest possible temperature. There are no negative temperatures in Kelvin.\n\nConversion formulas:\nTo Celsius: °C = K - 273.15\nTo Fahrenheit: °F = (K - 273.15) × 9/5 + 32',
        'icon': Icons.science,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: const Text('Temperature Scales'),
      ),
      body: ListView.builder(
        itemCount: temperatureUnits.length,
        itemBuilder: (context, index) {
          final unit = temperatureUnits[index];
          return TemperatureUnitTile(
            title: unit['title'],
            description: unit['description'],
            icon: unit['icon'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TemperatureUnitPage(
                    title: unit['title'],
                    definition: unit['definition'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
