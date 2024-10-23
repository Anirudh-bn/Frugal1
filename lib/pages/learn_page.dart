import 'package:flutter/material.dart';
import 'package:frugal1/pages/Weight_page.dart';
import 'package:frugal1/pages/length_page.dart';
import 'package:frugal1/pages/temperature_page.dart';
import 'package:frugal1/pages/volume_page.dart';
import 'package:frugal1/widgets/learn_tile.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  // List of learning items
  final List<Map<String, dynamic>> learnItems = const [
    {
      'title': 'LENGTH',
      'onTap': null, // You'll add navigation functions here
    },
    {
      'title': 'WEIGHT',
      'onTap': null,
    },
    {
      'title': 'TEMPERATURE',
      'onTap': null,
    },
    {
      'title': 'VOLUME',
      'onTap': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: const Text('LEARN'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: learnItems
              .map((item) => LearnTile(
                    title: item['title'],
                    onTap: () {
                      // Add navigation based on title
                      switch (item['title']) {
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
