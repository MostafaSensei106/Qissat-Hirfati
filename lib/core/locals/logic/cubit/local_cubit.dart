// lib/cubit/locale_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template locale_cubit}
/// A [Cubit] that manages the user's [Locale].
///
/// The [LocaleCubit] is responsible for storing and providing the
/// user's [Locale]. It also provides a method to update the user's
/// [Locale].
///
/// The [LocaleCubit] is initialized with the default locale for the
/// app which is [Locale('ar', 'SA')].
/// {@endtemplate}
class LocaleCubit extends Cubit<Locale> {
  /// {@macro locale_cubit}
  LocaleCubit() : super(const Locale('ar', 'SA'));

  /// {@template change_locale}
  /// Updates the user's [Locale].
  ///
  /// This method updates the user's [Locale] and emits the new
  /// locale to all the subscribers of the [LocaleCubit].
  ///
  /// The [locale] parameter is the new [Locale] that the user
  /// wants to use.
  /// {@endtemplate}
  void changeLocale(Locale locale) {
    emit(locale);
  }
}
