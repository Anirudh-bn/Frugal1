import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/providers/locale_provider.dart';
import 'package:frugal1/services/audio_service.dart';

class VolumeUnitPage extends StatefulWidget {
  final String unitType;

  const VolumeUnitPage({
    required this.unitType,
    super.key,
  });

  @override
  State<VolumeUnitPage> createState() => _VolumeUnitPageState();
}

class _VolumeUnitPageState extends State<VolumeUnitPage> {
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
      case 'ml':
        title = l10n.mlTitle;
        definition = l10n.mlDefinition;
        commonUses = [
          l10n.mlCommonUses1,
          l10n.mlCommonUses2,
          l10n.mlCommonUses3,
          l10n.mlCommonUses4,
        ];
        break;
      case 'l':
        title = l10n.lTitle;
        definition = l10n.lDefinition;
        commonUses = [
          l10n.lCommonUses1,
          l10n.lCommonUses2,
          l10n.lCommonUses3,
          l10n.lCommonUses4,
        ];
        break;
      case 'm3':
        title = l10n.m3Title;
        definition = l10n.m3Definition;
        commonUses = [
          l10n.m3CommonUses1,
          l10n.m3CommonUses2,
          l10n.m3CommonUses3,
          l10n.m3CommonUses4,
        ];
        break;
      case 'floz':
        title = l10n.flozTitle;
        definition = l10n.flozDefinition;
        commonUses = [
          l10n.flozCommonUses1,
          l10n.flozCommonUses2,
          l10n.flozCommonUses3,
          l10n.flozCommonUses4,
        ];
        break;
      case 'cup':
        title = l10n.cupTitle;
        definition = l10n.cupDefinition;
        commonUses = [
          l10n.cupCommonUses1,
          l10n.cupCommonUses2,
          l10n.cupCommonUses3,
          l10n.cupCommonUses4,
        ];
        break;
      case 'pt':
        title = l10n.ptTitle;
        definition = l10n.ptDefinition;
        commonUses = [
          l10n.ptCommonUses1,
          l10n.ptCommonUses2,
          l10n.ptCommonUses3,
          l10n.ptCommonUses4,
        ];
        break;
      case 'qt':
        title = l10n.qtTitle;
        definition = l10n.qtDefinition;
        commonUses = [
          l10n.qtCommonUses1,
          l10n.qtCommonUses2,
          l10n.qtCommonUses3,
          l10n.qtCommonUses4,
        ];
        break;
      case 'gal':
        title = l10n.galTitle;
        definition = l10n.galDefinition;
        commonUses = [
          l10n.galCommonUses1,
          l10n.galCommonUses2,
          l10n.galCommonUses3,
          l10n.galCommonUses4,
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
}
