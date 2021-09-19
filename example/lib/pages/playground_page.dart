import 'package:example/components/ex_f_conainer.dart';
import 'package:flutter/material.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({Key? key}) : super(key: key);

  @override
  _PlaygroundPageState createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  @override
  Widget build(BuildContext context) {
    final aa = MediaQuery.of(context).devicePixelRatio;
    return const Scaffold(
      body: ExFContainer(),
    );
  }
}
