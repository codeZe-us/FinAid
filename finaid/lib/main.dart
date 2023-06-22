import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/helpers/db.helper.dart';
import 'presentation/view_models/bloc/cubit/app.dart';
import 'presentation/view_models/bloc/cubit/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getDBInstance();
  AppState appState = await AppState.getState();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=>AppCubit(appState)),
          ],
          child: const App(),
      ),
  );
}


