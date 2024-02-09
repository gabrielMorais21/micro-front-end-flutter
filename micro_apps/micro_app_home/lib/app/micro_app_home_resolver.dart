import 'package:event_bridge/event_bridge.dart';
import 'package:event_bridge/events.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_app_home/app/pages/historic.dart';
import 'package:micro_app_home/app/pages/settings.dart';
import 'package:micro_core/micro_core.dart';
import 'pages/home_page.dart';

final sl = GetIt.instance;

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => "micro_app_home";

  @override
  List<RouteBase> get routes => [];

  @override
  List<RouteBase> get bottomNavigationroutes => [
        GoRoute(
          name: 'home',
          path: 'home',
          builder: (context, state) => HomePage(teste: sl.get<Teste>(), ),
        ),
        GoRoute(
          name: 'historic',
          path: 'historic',
          builder: (context, state) => HistoricPage(teste: sl.get<Teste>()),
        ),
        GoRoute(
          name: 'settings',
          path: 'settings',
          builder: (context, state) => SettingsPage(teste: sl.get<Teste>()),
        ),
      ];

  @override
  void Function() get injectionsRegister => () {
        sl.registerLazySingleton<Teste>(() => TesteImp());
      };

  @override
  void Function() get createListener => () {
        EventBridge eventBridge = EventBridge();
        eventBridge.eventBus.on<UserLoggedInEvent>().listen((event) {
          // ignore: avoid_print
          print(event.user);
        });
      };
}

abstract class Teste {
  olamundo();
}

class TesteImp implements Teste {
  @override
  olamundo() {
    // ignore: avoid_print
    print("ola mundo");
  }
}
