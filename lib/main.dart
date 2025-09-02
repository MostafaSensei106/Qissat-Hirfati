import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:qissat_hirfati/core/locals/logic/cubit/local_cubit.dart';
import 'package:qissat_hirfati/core/shared_preferences_global/shared_preferences_global.dart';
import 'package:qissat_hirfati/qissat_hirfati_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesGlobal().initialize();
  runApp(
    BlocProvider(create: (_) => LocaleCubit(), child: const QissatHirfatiApp()),
  );
}
