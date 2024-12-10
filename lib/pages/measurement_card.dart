class MeasurementPair {
  final int id;
  final Map<String, String> imperial;
  final Map<String, String> metric;
  final Map<String, String> imperialFullForm; // Add this
  final Map<String, String> metricFullForm;
  final String category;

  MeasurementPair({
    required this.id,
    required this.imperial,
    required this.metric,
    required this.category,
    required this.imperialFullForm, // Add this
    required this.metricFullForm,
  });
}

class GameCard {
  final String id;
  final Map<String, String> value;
  final Map<String, String> fullForm;
  final int pairId;
  final String type;
  bool isMatched;
  bool isSelected;

  GameCard({
    required this.id,
    required this.value,
    required this.fullForm,
    required this.pairId,
    required this.type,
    this.isMatched = false,
    this.isSelected = false,
  });
}
