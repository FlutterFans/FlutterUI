part of 'global_setting_bloc.dart';

@immutable
abstract class GlobalSettingState {
  final GlobalAppSettings globalAppSettings;

  const GlobalSettingState({required this.globalAppSettings});
}

class GlobalSettingInitial extends GlobalSettingState {
  const GlobalSettingInitial({required GlobalAppSettings globalAppSettings})
      : super(globalAppSettings: globalAppSettings);
}
