import 'package:go_router/go_router.dart';

abstract class MicroApp {
  String get microAppName;

  List<RouteBase> get routes;

  List<RouteBase> get bottomNavigationroutes;

  void Function() get injectionsRegister;

  void Function() get createListener;
}
