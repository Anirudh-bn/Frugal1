import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/providers/locale_provider.dart';

import 'measurement_card.dart';

class MeasurementGameScreen extends StatefulWidget {
  const MeasurementGameScreen({super.key});

  @override
  _MeasurementGameScreenState createState() => _MeasurementGameScreenState();
}

class _MeasurementGameScreenState extends State<MeasurementGameScreen> {
  int score = 0;
  int timeLeft = 60;
  bool gameStarted = false;
  Timer? gameTimer;
  List<GameCard> cards = [];
  GameCard? selectedCard;
  List<int> matchedPairs = [];

  List<MeasurementPair> getMeasurementPairs() {
    return [
      MeasurementPair(
        id: 1,
        imperial: {'en': '1 pound', 'es': '1 libra'},
        metric: {'en': '0.45 kg', 'es': '0,45 kg'},
        imperialFullForm: {'en': '(Pound)', 'es': '(Libra)'},
        metricFullForm: {'en': '(Kilogram)', 'es': '(Kilogramo)'},
        category: 'weight',
      ),
      MeasurementPair(
        id: 2,
        imperial: {'en': '1 gallon', 'es': '1 galón'},
        metric: {'en': '3.78 L', 'es': '3,78 L'},
        imperialFullForm: {'en': '(Gallon)', 'es': '(Galón)'},
        metricFullForm: {'en': '(Liter)', 'es': '(Litro)'},
        category: 'volume',
      ),
      MeasurementPair(
        id: 3,
        imperial: {'en': '1 mile', 'es': '1 milla'},
        metric: {'en': '1.6 km', 'es': '1,6 km'},
        imperialFullForm: {'en': '(Mile)', 'es': '(Milla)'},
        metricFullForm: {'en': '(Kilometer)', 'es': '(Kilómetro)'},
        category: 'length',
      ),
      MeasurementPair(
        id: 4,
        imperial: {'en': '32°F', 'es': '32°F'},
        metric: {'en': '0°C', 'es': '0°C'},
        imperialFullForm: {'en': '(Fahrenheit)', 'es': '(Fahrenheit)'},
        metricFullForm: {'en': '(Celsius)', 'es': '(Celsius)'},
        category: 'temperature',
      ),
      MeasurementPair(
        id: 5,
        imperial: {'en': '2 cups', 'es': '2 tazas'},
        metric: {'en': '473 ml', 'es': '473 ml'},
        imperialFullForm: {'en': '(Cups)', 'es': '(Tazas)'},
        metricFullForm: {'en': '(Milliliter)', 'es': '(Mililitro)'},
        category: 'volume',
      ),
      MeasurementPair(
        id: 6,
        imperial: {'en': '1 inch', 'es': '1 pulgada'},
        metric: {'en': '2.54 cm', 'es': '2,54 cm'},
        imperialFullForm: {'en': '(Inch)', 'es': '(Pulgada)'},
        metricFullForm: {'en': '(Centimeter)', 'es': '(Centímetro)'},
        category: 'length',
      ),
    ];
  }

  void initializeGame() {
    String locale = context.read<LocaleProvider>().locale.languageCode;
    List<GameCard> gameCards = [];
    for (var pair in getMeasurementPairs()) {
      gameCards.addAll([
        GameCard(
          id: "${pair.id}-imperial",
          value: pair.imperial,
          fullForm: pair.imperialFullForm,
          pairId: pair.id,
          type: 'imperial',
        ),
        GameCard(
          id: "${pair.id}-metric",
          value: pair.metric,
          fullForm: pair.metricFullForm,
          pairId: pair.id,
          type: 'metric',
        ),
      ]);
    }

    gameCards.shuffle();

    setState(() {
      cards = gameCards;
      gameStarted = true;
      timeLeft = 60;
      score = 0;
      matchedPairs = [];
      selectedCard = null;
    });

    startTimer();
  }

  void startTimer() {
    gameTimer?.cancel();
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          endGame();
        }
      });
    });
  }

  void endGame() {
    gameTimer?.cancel();
    setState(() {
      gameStarted = false;
    });
    showGameOverDialog();
  }

  void handleCardClick(GameCard card) {
    if (!gameStarted || matchedPairs.contains(card.pairId)) return;

    setState(() {
      if (selectedCard == null) {
        selectedCard = card;
        card.isSelected = true;
      } else {
        if (selectedCard!.pairId == card.pairId &&
            selectedCard!.id != card.id) {
          // Match found
          matchedPairs.add(card.pairId);
          score += 100;
          card.isMatched = true;
          cards[cards.indexWhere((c) => c.id == selectedCard!.id)].isMatched =
              true;
        } else {
          // No match
          score = (score - 20).clamp(0, double.infinity).toInt();
        }
        selectedCard!.isSelected = false;
        selectedCard = null;
      }
    });

    if (matchedPairs.length == getMeasurementPairs().length) {
      endGame();
    }
  }

  void showGameOverDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.gameOver),
          content: Text('${l10n.finalScore}: $score'),
          actions: [
            TextButton(
              child: Text(l10n.playAgain),
              onPressed: () {
                Navigator.of(context).pop();
                initializeGame();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Show instructions dialog when the game screen first opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showInstructionsDialog();
    });
  }

  void showInstructionsDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.school, color: Color(0xFF00A6DA)),
              const SizedBox(width: 10),
              Text(l10n.instructions),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.gameInstructions,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 20),
                // Example visualization
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('1 mile'),
                          ),
                          const Icon(Icons.arrow_downward, color: Colors.green),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('1.6 km'),
                          ),
                        ],
                      ),
                      const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(l10n.gotIt),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = context.watch<LocaleProvider>().locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(l10n.measurementMatchGame),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: showInstructionsDialog,
            tooltip: l10n.howToPlay,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                context.read<LocaleProvider>().toggleLocale();
              },
              child: Text(
                locale == 'en' ? 'ES' : 'EN',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${l10n.score}: $score',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${l10n.time}: $timeLeft${l10n.seconds}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (!gameStarted)
              Center(
                child: ElevatedButton(
                  onPressed: initializeGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    l10n.startGame,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              )
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return GestureDetector(
                      onTap: () => handleCardClick(card),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: card.isMatched
                              ? Colors.green.shade100
                              : card.isSelected
                                  ? Colors.blue.shade100
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  card.value[locale] ?? card.value['en']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    height: 4), // Small spacing between texts
                                Text(
                                  card.fullForm[locale] ?? card.fullForm['en']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
