import 'package:flutter/material.dart';
import '../models/ats_result_model.dart';
import '../services/mock_api_service.dart';

class ResumeProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  AtsResult? result;

  final MockApiService _apiService = MockApiService();

  Future<void> uploadResume() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      result = await _apiService.uploadResume();
    } catch (e) {
      error = "Something went wrong!";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
