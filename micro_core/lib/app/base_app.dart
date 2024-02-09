import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_core/app/micro_core_utils.dart';

import 'microapp.dart';

mixin BaseApp {
  List<MicroApp> get microApps;

  List<RouteBase> get baseRoutes;

  final List<RouteBase> routes = [];

  final List<RouteBase> bottomNavigationroutes = [];

  void registerRouters() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        bottomNavigationroutes.addAll(microapp.bottomNavigationroutes);
      }
    }

    if (baseRoutes.isNotEmpty && bottomNavigationroutes.isNotEmpty)
      routes.addAll(baseRoutes);
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

  GoRouter generateRouteConfig(
          {required String initialLocation, required Widget splashScreen}) =>
      GoRouter(
          initialLocation: initialLocation,
          routes: [
            GoRoute(
                path: '/',
                builder: (BuildContext context, GoRouterState state) {
                  return splashScreen;
                },
                routes: routes),
          ],
          navigatorKey: rootNavigator);
}
