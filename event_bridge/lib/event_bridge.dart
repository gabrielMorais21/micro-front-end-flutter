
import 'package:event_bus/event_bus.dart';

class EventBridge {
final EventBus eventBus = EventBus();
  EventBridge._internal();
  static final EventBridge _singleton = EventBridge._internal();
  factory EventBridge() => _singleton;


}
