import 'package:example/blocs/global/global_setting_bloc.dart';
import 'package:example/components/menu_demo.dart';
import 'package:example/config/global_app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:provider/src/provider.dart';

class ExFContainer extends StatelessWidget {
  const ExFContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTheme = AppTheme.of(context).fButtonThemeData;
    return FContainer(
      axis: Axis.vertical,
      children: [
        FHeader(
          height: 80,
          child: buildHeader(buttonTheme, context),
        ),
        FHLine(),
        FContainer(
          axis: Axis.horizontal,
          children: [
            FAside(
              width: 240,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return MenuDemo();
                },
              ),
            ),
            FVLine(),
            FContainer(
              axis: Axis.vertical,
              children: [
                FMain(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Text('Main Size: ${constraints.maxWidth} * ${constraints.maxHeight}');
                    },
                  ),
                ),
                FHLine(),
                FFooter(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Text('Footer: ${constraints.maxWidth} * ${constraints.maxHeight}');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row buildHeader(FButtonThemeData buttonTheme, BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Flutter UI',
              style: TextStyle(
                color: buttonTheme.normalColor,
                fontSize: 28,
              ),
            ),
            Row(
              children: [
                Switch(
                  value: GlobalAppSettings.globalAppSettings.isDark,
                  onChanged: (value) {
                    context.read<GlobalSettingBloc>().add(
                          SwitchDarkTheme(isChangeToDark: !GlobalAppSettings.globalAppSettings.isDark),
                        );
                  },
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    !GlobalAppSettings.globalAppSettings.isDark ? 'Day' : 'Night',
                    style: TextStyle(
                      color: buttonTheme.normalColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
