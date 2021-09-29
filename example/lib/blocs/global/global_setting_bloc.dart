import 'dart:async';

import 'package:example/config/global_app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:meta/meta.dart';

part 'global_setting_event.dart';
part 'global_setting_state.dart';

class GlobalSettingBloc extends Bloc<GlobalSettingEvent, GlobalSettingState> {
  GlobalSettingBloc()
      : super(GlobalSettingInitial(
          globalAppSettings: GlobalAppSettings.globalAppSettings,
        ));

  @override
  Stream<GlobalSettingState> mapEventToState(
    GlobalSettingEvent event,
  ) async* {
    final settings = GlobalAppSettings.globalAppSettings;
    if (event is ChangeButtonTheme) {
      settings.fButtonThemeData = event.fButtonThemeData;
      yield GlobalSettingInitial(globalAppSettings: settings);
    } else if (event is SwitchDarkTheme) {
      settings.isDark = event.isChangeToDark;
      yield GlobalSettingInitial(globalAppSettings: settings);
    }
  }
}
