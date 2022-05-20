import 'package:flutter/material.dart';

import 'presentation/routes/navigation.dart';
import 'presentation/routes/routes.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.HOME,
      routes: Navigation.pages,
    );
  }
}
