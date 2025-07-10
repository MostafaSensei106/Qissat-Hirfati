// lib/cubit/locale_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {

  LocaleCubit() : super(const Locale('ar', 'SA')) {
    _loadSavedLocale();
  }
  static const String _localeKey = 'saved_locale';

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localeKey);
    if (code != null) {
      final parts = code.split('_');
      emit(Locale(parts[0], parts.length > 1 ? parts[1] : null));
    }
  }

  Future<void> changeLocale(Locale locale) async {
    emit(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, '${locale.languageCode}_${locale.countryCode ?? ''}');
  }
}
