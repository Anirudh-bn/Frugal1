import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frugal1/providers/locale_provider.dart';

class WeightUnitPage extends StatelessWidget {
  final String unitType;

  const WeightUnitPage({
    required this.unitType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const CircularProgressIndicator();

    // Get the translated strings based on unitType
    String title;
    String definition;
    List<String> commonUses;

    switch (unitType) {
      case 'mg':
        title = l10n.mgTitle;
        definition = l10n.mgDefinition;
        commonUses = [
          l10n.mgCommonUses1,
          l10n.mgCommonUses2,
          l10n.mgCommonUses3,
          l10n.mgCommonUses4,
        ];
        break;
      case 'g':
        title = l10n.gTitle;
        definition = l10n.gDefinition;
        commonUses = [
          l10n.gCommonUses1,
          l10n.gCommonUses2,
          l10n.gCommonUses3,
          l10n.gCommonUses4,
        ];
        break;
      case 'kg':
        title = l10n.kgTitle;
        definition = l10n.kgDefinition;
        commonUses = [
          l10n.kgCommonUses1,
          l10n.kgCommonUses2,
          l10n.kgCommonUses3,
          l10n.kgCommonUses4,
        ];
        break;
      case 't':
        title = l10n.tTitle;
        definition = l10n.tDefinition;
        commonUses = [
          l10n.tCommonUses1,
          l10n.tCommonUses2,
          l10n.tCommonUses3,
          l10n.tCommonUses4,
        ];
        break;
      case 'oz':
        title = l10n.ozTitle;
        definition = l10n.ozDefinition;
        commonUses = [
          l10n.ozCommonUses1,
          l10n.ozCommonUses2,
          l10n.ozCommonUses3,
          l10n.ozCommonUses4,
        ];
        break;
      case 'lb':
        title = l10n.lbTitle;
        definition = l10n.lbDefinition;
        commonUses = [
          l10n.lbCommonUses1,
          l10n.lbCommonUses2,
          l10n.lbCommonUses3,
          l10n.lbCommonUses4,
        ];
        break;
      case 'st':
        title = l10n.stTitle;
        definition = l10n.stDefinition;
        commonUses = [
          l10n.stCommonUses1,
          l10n.stCommonUses2,
          l10n.stCommonUses3,
          l10n.stCommonUses4,
        ];
        break;
      case 'ton':
        title = l10n.tonTitle;
        definition = l10n.tonDefinition;
        commonUses = [
          l10n.tonCommonUses1,
          l10n.tonCommonUses2,
          l10n.tonCommonUses3,
          l10n.tonCommonUses4,
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
