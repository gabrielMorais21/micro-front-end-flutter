import 'package:get_it/get_it.dart';

import 'micro_core_utils.dart';

abstract class MicroApp {
  String get microAppName;

  Map<String, WidgetBuilderArgs> get routes;

  void Function() get injectionsRegister;

  void Function() get createListener;
}
