import 'package:flutter/material.dart';
import 'package:frugal1/pages/lengthUnitPage.dart';
import 'package:frugal1/widgets/length_unit_tile.dart';

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

  final List<Map<String, dynamic>> metricUnits = [
    {
      'title': 'Millimeter (mm)',
      'description': 'The smallest metric unit of length',
      'definition':
          'A millimeter is one thousandth of a meter (1/1000 meter). It is commonly used for very small measurements such as technical drawings, medical equipment, and precision tools.',
      'commonUses': [
        'Technical drawings and blueprints',
        'Medical instruments and procedures',
        'Electronics components',
        'Precision manufacturing'
      ]
    },
    {
      'title': 'Centimeter (cm)',
      'description': 'Common metric unit for small measurements',
      'definition':
          'A centimeter is one hundredth of a meter (1/100 meter). It is commonly used for everyday measurements like body height, furniture dimensions, and small objects.',
      'commonUses': [
        'Body measurements',
        'Furniture dimensions',
        'Clothing measurements',
        'School supplies (rulers, etc.)'
      ]
    },
    {
      'title': 'Meter (m)',
      'description': 'The base unit of length in SI',
      'definition':
          'The meter is the base unit of length in the International System of Units (SI). Originally defined as one ten-millionth of the distance from the equator to the North Pole, it is now defined by the speed of light in vacuum.',
      'commonUses': [
        'Room dimensions',
        'Building measurements',
        'Athletic events',
        'Construction materials'
      ]
    },
    {
      'title': 'Kilometer (km)',
      'description': 'Used for measuring long distances',
      'definition':
          'A kilometer is one thousand meters (1000 meters). It is commonly used for measuring long distances like road lengths, geographic distances, and travel distances. 1 km = 0.621371 miles.',
      'commonUses': [
        'Road distances',
        'Travel planning',
        'Geographic measurements',
        'Marathon and racing events'
      ]
    },
  ];

  final List<Map<String, dynamic>> usUnits = [
    {
      'title': 'Inch (in)',
      'description': 'Basic unit of length in US system',
      'definition':
          'An inch is exactly 2.54 centimeters. It is commonly used in the US for small measurements like screen sizes, rainfall, and small object dimensions. 12 inches make 1 foot.',
      'commonUses': [
        'Screen sizes (TV, phones, etc.)',
        'Lumber dimensions',
        'Rainfall measurements',
        'Paper sizes'
      ]
    },
    {
      'title': 'Foot (ft)',
      'description': 'Standard US unit for medium lengths',
      'definition':
          'A foot is equal to 12 inches or approximately 30.48 centimeters. It is commonly used in the US for measuring height, room dimensions, and building measurements. 3 feet make 1 yard.',
      'commonUses': [
        'Human height',
        'Room dimensions',
        'Building measurements',
        'Ceiling heights'
      ]
    },
    {
      'title': 'Yard (yd)',
      'description': 'Common unit for larger measurements',
      'definition':
          'A yard is equal to 3 feet or 36 inches (approximately 0.9144 meters). It is commonly used in the US for measuring fabric, sports fields, and landscaping distances.',
      'commonUses': [
        'Fabric measurements',
        'Sports field dimensions',
        'Landscaping',
        'Football field measurements'
      ]
    },
    {
      'title': 'Mile (mi)',
      'description': 'US unit for long distances',
      'definition':
          'A mile is equal to 5,280 feet or 1.60934 kilometers. It is the standard unit for measuring long distances in the US, commonly used for road distances, travel distances, and geographic measurements.',
      'commonUses': [
        'Road distances',
        'Running and walking events',
        'City planning',
        'Navigation'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: const Text('Length Units'),
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
              return LengthUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LengthUnitPage(
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
              return LengthUnitTile(
                title: unit['title']!,
                description: unit['description']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LengthUnitPage(
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
