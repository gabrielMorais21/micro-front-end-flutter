import 'package:event_bridge/event_bridge.dart';
import 'package:event_bridge/events.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_core/micro_core.dart';
import 'pages/home_page.dart';

final sl = GetIt.instance;

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => "micro_app_home";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/home': (context, args) => HomePage(teste: sl.get<Teste>()),
      };
  
  @override
  void Function() get injectionsRegister => () {
    sl.registerLazySingleton<Teste>(() => TesteImp());
  };

  @override
  void Function() get createListener => () {
    EventBridge eventBridge = EventBridge();
    eventBridge.eventBus.on<UserLoggedInEvent>().listen((event) {
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
