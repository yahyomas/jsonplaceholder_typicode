import 'package:demo_app/core/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'features/users_list/presentation/page/users_page.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      home: UsersPage(),
    );
  }
}
