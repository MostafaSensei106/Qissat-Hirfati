import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:qissat_hirfati/core/locals/logic/cubit/local_cubit.dart';
import 'package:qissat_hirfati/qissat_hirfati_app.dart';

/// The main entrypoint for the application.
///
/// This function creates a [BlocProvider] that provides the [LocaleCubit]
/// to all of its descendants. It then runs the [QissatHirfatiApp] widget.
void main() {
  runApp(
    BlocProvider(create: (_) => LocaleCubit(), child: const QissatHirfatiApp()),
  );
}
