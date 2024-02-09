import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'microapp.dart';

final sl = GetIt.instance;
mixin BaseApp {
  List<MicroApp> get microApps;

  List<RouteBase> get baseRoutes;

  final List<RouteBase> routes = [];

  final List<RouteBase> bottomNavigationroutes = [];

  final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

  final GlobalKey<NavigatorState> shellNavigator =
      GlobalKey(debugLabel: 'shell');

  void registerRouters() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        bottomNavigationroutes.addAll(microapp.bottomNavigationroutes);
      }
    }

    if (baseRoutes.isNotEmpty && bottomNavigationroutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  void registerDependecies() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        microapp.injectionsRegister();
      }
    }
  }

  void registerListeners() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        microapp.createListener();
      }
    }
  }

  GoRouter generateRouteConfig({required String initialLocation}) => GoRouter(
      initialLocation: initialLocation,
      routes: routes,
      navigatorKey: rootNavigator);
}
