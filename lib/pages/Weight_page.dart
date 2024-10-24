import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/pages/weightUnitPage.dart';
import 'package:frugal1/widgets/weight_unit_tile.dart';
import 'package:frugal1/providers/locale_provider.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage>
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
        'unitType': 'mg',
        'title': l10n.mgTitle,
        'description': l10n.mgDescription,
      },
      {
        'unitType': 'g',
        'title': l10n.gTitle,
        'description': l10n.gDescription,
      },
      {
        'unitType': 'kg',
        'title': l10n.kgTitle,
        'description': l10n.kgDescription,
      },
      {
        'unitType': 't',
        'title': l10n.tTitle,
        'description': l10n.tDescription,
      },
    ];

    final List<Map<String, dynamic>> usUnits = [
      {
        'unitType': 'oz',
        'title': l10n.ozTitle,
        'description': l10n.ozDescription,
      },
      {
        'unitType': 'lb',
        'title': l10n.lbTitle,
        'description': l10n.lbDescription,
      },
      {
        'unitType': 'st',
        'title': l10n.stTitle,
        'description': l10n.stDescription,
      },
      {
        'unitType': 'ton',
        'title': l10n.tonTitle,
        'description': l10n.tonDescription,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.weightUnits),
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
              return WeightUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeightUnitPage(
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
              return WeightUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeightUnitPage(
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
