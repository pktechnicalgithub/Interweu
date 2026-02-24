class AtsResult {
  final int score;
  final List<String> matchedKeywords;
  final List<String> missingKeywords;
  final String summary;

  AtsResult({
    required this.score,
    required this.matchedKeywords,
    required this.missingKeywords,
    required this.summary,
  });

  factory AtsResult.fromJson(Map<String, dynamic> json) {
    return AtsResult(
      score: json['score'],
      matchedKeywords: List<String>.from(json['matched_keywords']),
      missingKeywords: List<String>.from(json['missing_keywords']),
      summary: json['summary'],
    );
  }
}
