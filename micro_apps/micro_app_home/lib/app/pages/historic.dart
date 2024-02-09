import 'dart:async';

import 'package:event_bridge/event_bridge.dart';
import 'package:event_bridge/events.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/app/micro_app_home_resolver.dart';

class HistoricPage extends StatefulWidget {
  final Teste teste;
  const HistoricPage({Key? key, required this.teste}) : super(key: key);

  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  void initState() {
    widget.teste.olamundo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoricPage'),
      ),
    );
  }
}
