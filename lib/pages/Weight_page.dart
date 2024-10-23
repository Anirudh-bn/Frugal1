import 'package:flutter/material.dart';
import 'package:frugal1/pages/weightUnitPage.dart';
import 'package:frugal1/widgets/Weight_unit_tile.dart';

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

  final List<Map<String, dynamic>> metricUnits = [
    {
      'title': 'Milligram (mg)',
      'description': 'Smallest commonly used metric weight unit',
      'definition':
          'A milligram is one thousandth (1/1000) of a gram. It is commonly used in medicine for precise measurements of medication dosages and in scientific laboratories.',
      'commonUses': [
        'Medication dosages',
        'Nutritional supplements',
        'Laboratory measurements',
        'Chemical compounds'
      ]
    },
    {
      'title': 'Gram (g)',
      'description': 'Basic metric unit of mass',
      'definition':
          'A gram is the basic unit of mass in the metric system. It is commonly used for measuring small quantities of food ingredients, chemicals, and other lightweight items. 1 gram = 0.035274 ounces.',
      'commonUses': [
        'Food ingredients',
        'Postal services',
        'Jewelry weight',
        'Cooking measurements'
      ]
    },
    {
      'title': 'Kilogram (kg)',
      'description': 'Standard metric unit for weight',
      'definition':
          'A kilogram is equal to 1000 grams. It is the standard unit of mass in the metric system and is used for measuring body weight, grocery items, and medium-sized objects. 1 kg = 2.20462 pounds.',
      'commonUses': [
        'Body weight',
        'Grocery items',
        'Luggage weight',
        'Gym equipment'
      ]
    },
    {
      'title': 'Metric Ton (t)',
      'description': 'Used for very heavy weights',
      'definition':
          'A metric ton is equal to 1000 kilograms. It is used for measuring very heavy items like vehicles, shipping containers, and industrial materials. 1 metric ton = 2204.62 pounds.',
      'commonUses': [
        'Shipping containers',
        'Vehicle weights',
        'Industrial materials',
        'Bulk commodities'
      ]
    },
  ];

  final List<Map<String, dynamic>> usUnits = [
    {
      'title': 'Ounce (oz)',
      'description': 'Basic US unit for small weights',
      'definition':
          'An ounce is equal to 28.3495 grams. It is commonly used in the US for measuring small quantities of food, beverages, and other lightweight items. 16 ounces = 1 pound.',
      'commonUses': [
        'Food packaging',
        'Beverage sizes',
        'Precious metals',
        'Personal care products'
      ]
    },
    {
      'title': 'Pound (lb)',
      'description': 'Standard US weight unit',
      'definition':
          'A pound is equal to 16 ounces or 0.453592 kilograms. It is the standard unit of weight in the US system, used for measuring body weight, food items, and medium-sized objects.',
      'commonUses': [
        'Body weight',
        'Food quantities',
        'Package shipping',
        'Construction materials'
      ]
    },
    {
      'title': 'Stone (st)',
      'description': 'Traditional weight measure',
      'definition':
          'A stone is equal to 14 pounds or approximately 6.35 kilograms. While not commonly used in the US, it is still used in the UK and Ireland, particularly for measuring body weight.',
      'commonUses': [
        'Body weight (UK)',
        'Medical records',
        'Fitness tracking',
        'Weight loss goals'
      ]
    },
    {
      'title': 'US Ton',
      'description': 'US unit for very heavy weights',
      'definition':
          'A US ton (also called short ton) is equal to 2000 pounds or approximately 907.185 kilograms. It is commonly used in the US for measuring very heavy items like vehicles and industrial materials.',
      'commonUses': [
        'Construction materials',
        'Industrial equipment',
        'Agricultural products',
        'Mining materials'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: const Text('Weight Units'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Metric System'),
            Tab(text: 'US System'),
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
                        title: unit['title']!,
                        definition: unit['definition']!,
                        commonUses: List<String>.from(unit['commonUses']),
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
                        title: unit['title']!,
                        definition: unit['definition']!,
                        commonUses: List<String>.from(unit['commonUses']),
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
