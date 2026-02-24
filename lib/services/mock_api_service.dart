import 'dart:async';
import '../models/ats_result_model.dart';

class MockApiService {
  Future<AtsResult> uploadResume() async {
    await Future.delayed(Duration(seconds: 2));

    final mockResponse = {
      "score": 78,
      "matched_keywords": ["Python", "SQL"],
      "missing_keywords": ["Docker"],
      "summary": "Strong backend candidate",
    };

    return AtsResult.fromJson(mockResponse);
  }
}
