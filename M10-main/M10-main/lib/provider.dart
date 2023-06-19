import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  final List<String> _options = [
    'None',
    'Callisto',
    'Ganeymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
    'Sakura',
    'Sneakers',
  ];

  String? _selectedOption = 'Luna';

  List<String> get options => _options;
  String? get selectedOption => _selectedOption;
  set selectedOption(String? options) {
    _selectedOption = options;
    notifyListeners();
  }
}
