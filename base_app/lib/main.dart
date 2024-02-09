import 'package:base_app/presentation/nested_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_app_login/app/micro_app_login_resolver.dart';

import 'package:micro_core/micro_core.dart';

import 'package:micro_app_home/micro_app_home.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget with BaseApp {
  @override
  Widget build(BuildContext context) {
    super.registerDependecies();
    super.registerListeners();
    super.registerRouters();


    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: generateRouteConfig(initialLocation: "/home"),
    );
  }

  @override
  List<RouteBase> get baseRoutes => [
        ShellRoute(
          
            navigatorKey: shellNavigator,
            builder: (context, state, child) => NestedNavigator(body: child),
            routes: bottomNavigationroutes)
      ];

  @override
  List<MicroApp> get microApps => [
        MicroAppHomeResolver(),
        MicroAppLoginResolver(),
      ];
}
