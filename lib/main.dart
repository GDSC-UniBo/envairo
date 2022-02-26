import 'package:envairo/router.dart';
import 'package:envairo/view/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Envairo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      initialRoute: MainPage.route,
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
