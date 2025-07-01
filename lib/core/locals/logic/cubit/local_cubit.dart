// lib/cubit/locale_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ar', 'SA'));

  void changeLocale(Locale locale) {
    emit(locale);
  }
}
