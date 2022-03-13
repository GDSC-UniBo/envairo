import 'package:envairo/router.dart';
import 'package:envairo/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
          designSize: const Size(750, 1334),
          builder: () {
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
      ),
    );
  }


}
