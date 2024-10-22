import 'package:flutter/material.dart';
import 'package:frugal1/pages/learn_page.dart';
import 'package:frugal1/pages/play_page.dart';
import 'package:frugal1/pages/practice_page.dart';
import 'package:frugal1/widgets/menu_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: const Text('MEASUREMENTS'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuItem(
              // Changed from buildMenuItem to MenuItem
              title: 'LEARN',
              icon: const Icon(Icons.book,
                  color: Colors.white, size: 30), // Fixed Icons constructor
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearnPage()),
                );
              },
            ),
            MenuItem(
              title: 'PLAY',
              icon: const Icon(Icons.games, color: Colors.white, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayPage()),
                );
              },
            ),
            MenuItem(
              title: 'PRACTICE',
              icon: const Icon(Icons.edit, color: Colors.white, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
