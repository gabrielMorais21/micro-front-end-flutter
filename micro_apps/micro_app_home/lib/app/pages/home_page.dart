import 'dart:async';

import 'package:event_bridge/event_bridge.dart';
import 'package:event_bridge/events.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_app_home/app/micro_app_home_resolver.dart';

class HomePage extends StatefulWidget {
  final Teste teste;
  const HomePage({Key? key, required this.teste}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.teste.olamundo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        
      ),
            body: Center(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: const Text('goToHome',),
                onPressed: () {
                  context.go('/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
