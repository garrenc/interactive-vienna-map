import 'dart:io';

import 'package:interactive_map_vienna_server/src/web/widgets/built_with_serverpod_page.dart';
import 'package:serverpod/serverpod.dart';

class RouteRoot extends WidgetRoute {
  @override
  Future<Widget> build(Session session, HttpRequest request) async {
    return BuiltWithServerpodPage();
  }
}
