import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/providers/locale_provider.dart';
import 'package:frugal1/services/audio_service.dart';

class LengthUnitPage extends StatefulWidget {
  final String unitType;

  const LengthUnitPage({
    required this.unitType,
    super.key,
  });

  @override
  State<LengthUnitPage> createState() => _LengthUnitPageState();
}

class _LengthUnitPageState extends State<LengthUnitPage> {
  final AudioService audioService = AudioService();

  @override
  void initState() {
    super.initState();
    // Play audio when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      audioService.playUnitAudio(widget.unitType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const CircularProgressIndicator();

    // Get the translated strings based on unitType
    String title;
    String definition;
    List<String> commonUses;

    switch (widget.unitType) {
      case 'millimeter':
        title = l10n.mmTitle;
        definition = l10n.mmDefinition;
        commonUses = [
          l10n.mmCommonUses1,
          l10n.mmCommonUses2,
          l10n.mmCommonUses3,
          l10n.mmCommonUses4,
        ];
        break;
      case 'centimeter':
        title = l10n.cmTitle;
        definition = l10n.cmDefinition;
        commonUses = [
          l10n.cmCommonUses1,
          l10n.cmCommonUses2,
          l10n.cmCommonUses3,
          l10n.cmCommonUses4,
        ];
        break;
      case 'meter':
        title = l10n.mTitle;
        definition = l10n.mDefinition;
        commonUses = [
          l10n.mCommonUses1,
          l10n.mCommonUses2,
          l10n.mCommonUses3,
          l10n.mCommonUses4,
        ];
        break;
      case 'kilometer':
        title = l10n.kmTitle;
        definition = l10n.kmDefinition;
        commonUses = [
          l10n.kmCommonUses1,
          l10n.kmCommonUses2,
          l10n.kmCommonUses3,
          l10n.kmCommonUses4,
        ];
        break;
      case 'inch':
        title = l10n.inTitle;
        definition = l10n.inDefinition;
        commonUses = [
          l10n.inCommonUses1,
          l10n.inCommonUses2,
          l10n.inCommonUses3,
          l10n.inCommonUses4,
        ];
        break;
      case 'foot':
        title = l10n.ftTitle;
        definition = l10n.ftDefinition;
        commonUses = [
          l10n.ftCommonUses1,
          l10n.ftCommonUses2,
          l10n.ftCommonUses3,
          l10n.ftCommonUses4,
        ];
        break;
      case 'yard':
        title = l10n.ydTitle;
        definition = l10n.ydDefinition;
        commonUses = [
          l10n.ydCommonUses1,
          l10n.ydCommonUses2,
          l10n.ydCommonUses3,
          l10n.ydCommonUses4,
        ];
        break;
      case 'mile':
        title = l10n.miTitle;
        definition = l10n.miDefinition;
        commonUses = [
          l10n.miCommonUses1,
          l10n.miCommonUses2,
          l10n.miCommonUses3,
          l10n.miCommonUses4,
        ];
        break;
      default:
        title = '';
        definition = '';
        commonUses = [];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6DA),
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Audio button
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              audioService.playUnitAudio(widget.unitType);
            },
          ),
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
      body: Consumer<LocaleProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up),
                      onPressed: () {
                        audioService.playUnitAudio(widget.unitType);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Text(
                    definition,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.commonUses,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...commonUses.map((use) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.circle,
                                    size: 8, color: Colors.brown),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    use,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A6DA),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      l10n.next,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
