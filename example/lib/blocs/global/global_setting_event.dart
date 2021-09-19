part of 'global_setting_bloc.dart';

@immutable
abstract class GlobalSettingEvent {}

class ChangeButtonTheme extends GlobalSettingEvent {
  final FButtonThemeData fButtonThemeData;

  ChangeButtonTheme({required this.fButtonThemeData});
}
