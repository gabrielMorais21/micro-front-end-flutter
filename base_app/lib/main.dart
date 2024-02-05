import 'package:flutter/material.dart';
import 'package:micro_app_login/app/micro_app_login_resolver.dart';

import 'package:micro_core/micro_core.dart';

import 'package:micro_app_home/micro_app_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  @override
  Widget build(BuildContext context) {
    super.registerDependecies();
    super.registerListeners();
    super.registerRouters();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppHomeResolver(),
        MicroAppLoginResolver(),
      ];
}
