import 'package:example/blocs/global/global_setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/flutter_ui.dart';

class ExFContainer extends StatelessWidget {
  const ExFContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTheme = AppTheme.of(context).fButtonThemeData;
    return FContainer(
      axis: Axis.vertical,
      children: [
        FHeader(
          color: Colors.red,
          child: Row(
            children: [
              Text(
                'FHeader',
                style: TextStyle(
                  color: buttonTheme.normalColor,
                  fontSize: 13,
                ),
              ),
              TextButton(
                onPressed: () {
                  final newTheme =
                      buttonTheme.copyWith(normalColor: Colors.orange);
                  context.read<GlobalSettingBloc>().add(
                        ChangeButtonTheme(fButtonThemeData: newTheme),
                      );
                },
                child: Text('changeTheme'),
              )
            ],
          ),
        ),
        FContainer(
          axis: Axis.horizontal,
          children: [
            FAside(
              color: Colors.green,
              child: Text('FAside'),
            ),
            FContainer(
              axis: Axis.vertical,
              children: [
                FMain(
                  color: Colors.blue,
                  child: Text('FMain'),
                ),
                FFooter(
                  color: Colors.yellow,
                  child: Text('FFooter'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
