import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/pages/volumeunitpage.dart';
import 'package:frugal1/widgets/volume_unit_tile.dart';
import 'package:frugal1/providers/locale_provider.dart';

class VolumePage extends StatefulWidget {
  const VolumePage({super.key});

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const CircularProgressIndicator();

    final List<Map<String, dynamic>> metricUnits = [
      {
        'unitType': 'ml',
        'title': l10n.mlTitle,
        'description': l10n.mlDescription,
      },
      {
        'unitType': 'l',
        'title': l10n.lTitle,
        'description': l10n.lDescription,
      },
      {
        'unitType': 'm3',
        'title': l10n.m3Title,
        'description': l10n.m3Description,
      },
    ];

    final List<Map<String, dynamic>> usUnits = [
      {
        'unitType': 'floz',
        'title': l10n.flozTitle,
        'description': l10n.flozDescription,
      },
      {
        'unitType': 'cup',
        'title': l10n.cupTitle,
        'description': l10n.cupDescription,
      },
      {
        'unitType': 'pt',
        'title': l10n.ptTitle,
        'description': l10n.ptDescription,
      },
      {
        'unitType': 'qt',
        'title': l10n.qtTitle,
        'description': l10n.qtDescription,
      },
      {
        'unitType': 'gal',
        'title': l10n.galTitle,
        'description': l10n.galDescription,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.volumeUnits),
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: l10n.metricSystem),
            Tab(text: l10n.usSystem),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Metric Units ListView
          ListView.builder(
            itemCount: metricUnits.length,
            itemBuilder: (context, index) {
              final unit = metricUnits[index];
              return VolumeUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                unitType: unit['unitType']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolumeUnitPage(
                        unitType: unit['unitType']!,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          // US Units ListView
          ListView.builder(
            itemCount: usUnits.length,
            itemBuilder: (context, index) {
              final unit = usUnits[index];
              return VolumeUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                unitType: unit['unitType']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolumeUnitPage(
                        unitType: unit['unitType']!,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
