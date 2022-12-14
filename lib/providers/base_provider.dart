import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  bool _isFirstLoad = true;

  bool get isFirstLoad => _isFirstLoad;

  bool _isLoading = false;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  finishedFirstLoad() {
    _isFirstLoad = false;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  clearData() {
    _isFirstLoad = true;
    _isLoading = false;
    notifyListeners();
  }
}
