import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/pages/temperatureunitpage.dart';
import 'package:frugal1/widgets/temperature_unit_tile.dart';
import 'package:frugal1/providers/locale_provider.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const CircularProgressIndicator();

    final List<Map<String, dynamic>> temperatureUnits = [
      {
        'unitType': 'celsius',
        'title': l10n.celsiusTitle,
        'description': l10n.celsiusDescription,
        'icon': Icons.thermostat,
      },
      {
        'unitType': 'fahrenheit',
        'title': l10n.fahrenheitTitle,
        'description': l10n.fahrenheitDescription,
        'icon': Icons.device_thermostat,
      },
      {
        'unitType': 'kelvin',
        'title': l10n.kelvinTitle,
        'description': l10n.kelvinDescription,
        'icon': Icons.science,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.temperatureScales),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                context.read<LocaleProvider>().toggleLocale();
              },
              child: Text(
                context.watch<LocaleProvider>().locale.languageCode == 'en'
                    ? 'ES'
                    : 'EN',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: temperatureUnits.length,
        itemBuilder: (context, index) {
          final unit = temperatureUnits[index];
          return TemperatureUnitTile(
            title: unit['title']!,
            description: unit['description']!,
            icon: unit['icon'] as IconData,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TemperatureUnitPage(
                    unitType: unit['unitType']!,
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
