import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/pages/lengthunitpage.dart';
import 'package:frugal1/widgets/length_unit_tile.dart';
import 'package:frugal1/providers/locale_provider.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({super.key});

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage>
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
        'unitType': 'millimeter',
        'title': l10n.mmTitle,
        'description': l10n.mmDescription,
      },
      {
        'unitType': 'centimeter',
        'title': l10n.cmTitle,
        'description': l10n.cmDescription,
      },
      {
        'unitType': 'meter',
        'title': l10n.mTitle,
        'description': l10n.mDescription,
      },
      {
        'unitType': 'kilometer',
        'title': l10n.kmTitle,
        'description': l10n.kmDescription,
      },
    ];

    final List<Map<String, dynamic>> usUnits = [
      {
        'unitType': 'inch',
        'title': l10n.inTitle,
        'description': l10n.inDescription,
      },
      {
        'unitType': 'foot',
        'title': l10n.ftTitle,
        'description': l10n.ftDescription,
      },
      {
        'unitType': 'yard',
        'title': l10n.ydTitle,
        'description': l10n.ydDescription,
      },
      {
        'unitType': 'mile',
        'title': l10n.miTitle,
        'description': l10n.miDescription,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.lengthUnits),
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
              return LengthUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                unitType: unit['unitType']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LengthUnitPage(
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
              return LengthUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                unitType: unit['unitType']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LengthUnitPage(
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
