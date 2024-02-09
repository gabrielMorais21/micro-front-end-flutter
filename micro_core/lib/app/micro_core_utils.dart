import 'package:flutter/widgets.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');
