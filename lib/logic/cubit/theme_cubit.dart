import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themePrefKey = 'isDarkMode';

  bool isThemeLoaded = false;

  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  void toggleTheme(bool isDarkMode) async {
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePrefKey, isDarkMode);
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themePrefKey) ?? false;
    isThemeLoaded = true;
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
