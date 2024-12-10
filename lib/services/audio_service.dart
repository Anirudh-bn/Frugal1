import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();

  factory AudioService() {
    return _instance;
  }

  AudioService._internal();

  Future<void> playUnitAudio(String unitType) async {
    try {
      String fileName;
      switch (unitType) {
        // Temperature units
        case 'celsius':
          fileName = 'Celsius';
          break;
        case 'fahrenheit':
          fileName = 'Fahrenheit';
          break;
        case 'kelvin':
          fileName = 'Kelvin';
          break;

        // Length units
        case 'centimeter':
          fileName = 'Centimeter';
          break;
        case 'meter':
          fileName = 'Meter';
          break;
        case 'kilometer':
          fileName = 'Kilometer';
          break;
        case 'foot':
          fileName = 'Foot';
          break;
        case 'inch':
          fileName = 'Inch';
          break;
        case 'mile':
          fileName = 'Mile';
          break;
        case 'yard':
          fileName = 'Yard';
          break;
        case 'millimeter':
          fileName = 'Millimeter';
          break;

        // Volume units
        case 'cup':
          fileName = 'Cup';
          break;
        case 'gal':
          fileName = 'Gallon';
          break;
        case 'qt':
          fileName = 'Quart';
          break;
        case 'pt':
          fileName = 'Pint';
          break;
        case 'floz':
          fileName = 'FluidOunce';
          break;
        case 'l':
          fileName = 'Liter';
          break;
        case 'ml':
          fileName = 'Milliliter';
          break;
        case 'm3':
          fileName = 'Cubicmeter';
          break;

        // Mass/Weight units
        case 'g':
          fileName = 'Gram';
          break;
        case 'kg':
          fileName = 'Kilogram';
          break;
        case 'mg':
          fileName = 'Milligram';
          break;
        case 'oz':
          fileName = 'Ounce';
          break;
        case 'lb':
          fileName = 'Pound';
          break;
        case 'st':
          fileName = 'Stone';
          break;
        case 'ton':
          fileName = 'USton';
          break;
        case 't':
          fileName = 'Metricton';
          break;

        default:
          print('Unknown unit type: $unitType');
          return;
      }
      await _audioPlayer.play(AssetSource('audio/$fileName.mp3'));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
