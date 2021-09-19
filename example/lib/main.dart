import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/global/global_setting_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GlobalSettingBloc>(
          create: (context) => GlobalSettingBloc(),
        ),
      ],
      child: const App(),
    ),
  );
}
