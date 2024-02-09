import 'dart:async';

import 'package:event_bridge/event_bridge.dart';
import 'package:event_bridge/events.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/app/micro_app_home_resolver.dart';

class SettingsPage extends StatefulWidget {
  final Teste teste;
  const SettingsPage({Key? key, required this.teste}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    widget.teste.olamundo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsPage'),
      ),
    );
  }
}
