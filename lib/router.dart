
import 'package:envairo/view/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  RouteGenerator();

  final Map<String, Widget Function(BuildContext, dynamic)> _routes = {
    MainPage.route: (context, _) => const MainPage(),
  };

  Route<dynamic> generateRoute(RouteSettings settings){
    Widget Function(BuildContext, dynamic)? pageBuilder = _routes[settings.name!];
    if (pageBuilder != null) {
      return MaterialPageRoute(
          settings: settings,
          builder: (context) => pageBuilder(context, settings.arguments)
      );
    }

    throw Exception("Route ${settings.name} doesn't exists");
  }


}