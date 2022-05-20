import 'package:flutter/cupertino.dart';

import '../pages/home/home.dart';
import 'routes.dart';

class Navigation {
  static Map<String, Widget Function(BuildContext)> pages = {
    Routes.HOME: (_) => const Home(),
  };
}
