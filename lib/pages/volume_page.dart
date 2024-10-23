import 'package:flutter/material.dart';
import 'package:frugal1/pages/volumeunitpage.dart';
import 'package:frugal1/widgets/volume_unit_tile.dart';

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

  final List<Map<String, dynamic>> metricUnits = [
    {
      'title': 'Milliliter (mL)',
      'description': 'Basic metric unit for small volumes',
      'definition':
          'A milliliter is one thousandth (1/1000) of a liter. It is equal to one cubic centimeter (cm³). 1 mL = 0.0338 fluid ounces.',
      'commonUses': [
        'Medicine dosage measurements',
        'Small cooking measurements',
        'Laboratory measurements',
        'Small beverage portions'
      ]
    },
    {
      'title': 'Liter (L)',
      'description': 'Standard metric volume unit',
      'definition':
          'A liter is the basic metric unit of volume, equal to 1000 milliliters or 1 cubic decimeter. 1 L = 1.0567 US quarts.',
      'commonUses': [
        'Beverage containers',
        'Fuel measurements',
        'Large cooking measurements',
        'Water consumption'
      ]
    },
    {
      'title': 'Cubic Meter (m³)',
      'description': 'Larger metric volume unit',
      'definition':
          'A cubic meter is equal to 1000 liters. It is commonly used for larger volume measurements. 1 m³ = 264.172 US gallons.',
      'commonUses': [
        'Swimming pools',
        'Industrial containers',
        'Room volumes',
        'Water tanks'
      ]
    },
  ];

  final List<Map<String, dynamic>> usUnits = [
    {
      'title': 'Fluid Ounce (fl oz)',
      'description': 'Basic US unit for liquid volume',
      'definition':
          'A fluid ounce is about 29.5735 milliliters. 1 fl oz = 1/128 of a US gallon.',
      'commonUses': [
        'Beverage serving sizes',
        'Small cooking measurements',
        'Personal care products',
        'Medicine doses'
      ]
    },
    {
      'title': 'Cup',
      'description': 'Common US cooking measure',
      'definition':
          'A US cup is equal to 8 fluid ounces or about 236.588 milliliters.',
      'commonUses': [
        'Cooking and baking',
        'Recipe measurements',
        'Beverage servings',
        'Food packaging'
      ]
    },
    {
      'title': 'Pint (pt)',
      'description': 'Medium US volume measure',
      'definition':
          'A US pint is equal to 2 cups or 16 fluid ounces (about 473.176 milliliters).',
      'commonUses': [
        'Ice cream containers',
        'Milk containers',
        'Large cooking measurements'
      ]
    },
    {
      'title': 'Quart (qt)',
      'description': 'Larger US volume measure',
      'definition':
          'A US quart is equal to 2 pints or 32 fluid ounces (about 946.353 milliliters).',
      'commonUses': [
        'Large beverage containers',
        'Motor oil',
        'Large food containers',
        'Paint cans'
      ]
    },
    {
      'title': 'Gallon (gal)',
      'description': 'Large US volume unit',
      'definition':
          'A US gallon is equal to 4 quarts or 128 fluid ounces (about 3.78541 liters).',
      'commonUses': [
        'Milk containers',
        'Fuel measurements',
        'Water containers',
        'Large liquid products'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: const Text('Volume Units'),
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
              return VolumeUnitTile(
                title: unit['title'],
                description: unit['description'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolumeUnitPage(
                        title: unit['title'],
                        definition: unit['definition'],
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
              return VolumeUnitTile(
                title: unit['title'],
                description: unit['description'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolumeUnitPage(
                        title: unit['title'],
                        definition: unit['definition'],
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
