import 'package:example/blocs/global/global_setting_bloc.dart';
import 'package:example/config/global_app_settings.dart';
import 'package:example/pages/playground_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/flutter_ui.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSettingBloc, GlobalSettingState>(
      builder: (context, state) {
        GlobalAppSettings settings = state.globalAppSettings;
        final app = MaterialApp(
          title: 'Flutter UI',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const PlaygroundPage(),
        );
        return AppTheme(
          child: app,
          fButtonThemeData: settings.fButtonThemeData,
          fMenuThemeData: !settings.isDark ? FMenuThemeData() : FMenuThemeDataDark(),
        );
      },
    );
  }
}
