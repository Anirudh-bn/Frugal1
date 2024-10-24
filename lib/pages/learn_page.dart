import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/pages/weight_page.dart';
import 'package:frugal1/pages/length_page.dart';
import 'package:frugal1/pages/temperature_page.dart';
import 'package:frugal1/pages/volume_page.dart';
import 'package:frugal1/widgets/learn_tile.dart';
import 'package:frugal1/providers/locale_provider.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const CircularProgressIndicator();

    // List of learning items using localized strings
    final List<Map<String, dynamic>> learnItems = [
      {
        'title': l10n.lengthTitle,
        'key': 'LENGTH',
      },
      {
        'title': l10n.weightTitle,
        'key': 'WEIGHT',
      },
      {
        'title': l10n.temperatureTitle,
        'key': 'TEMPERATURE',
      },
      {
        'title': l10n.volumeTitle,
        'key': 'VOLUME',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.learn),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Add this actions list
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: learnItems
              .map((item) => LearnTile(
                    title: item['title'],
                    onTap: () {
                      // Add navigation based on key
                      switch (item['key']) {
                        case 'LENGTH':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LengthPage()),
                          );
                          break;
                        case 'WEIGHT':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WeightPage()));
                          break;
                        case 'TEMPERATURE':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TemperaturePage()));
                          break;
                        case 'VOLUME':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VolumePage()));
                          break;
                      }
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
