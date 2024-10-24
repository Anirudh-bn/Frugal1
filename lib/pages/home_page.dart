import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/pages/learn_page.dart';
import 'package:frugal1/pages/play_page.dart';
import 'package:frugal1/pages/practice_page.dart';
import 'package:frugal1/providers/locale_provider.dart';
import 'package:frugal1/widgets/menu_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // Using nullable operator because AppLocalizations might be null during initialization
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const CircularProgressIndicator();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.appTitle),
        elevation: 0,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuItem(
              title: l10n.learn,
              icon: const Icon(Icons.book, color: Colors.white, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearnPage()),
                );
              },
            ),
            MenuItem(
              title: l10n.play,
              icon: const Icon(Icons.games, color: Colors.white, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayPage()),
                );
              },
            ),
            MenuItem(
              title: l10n.practice,
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
