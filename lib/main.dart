import 'package:envairo/router.dart';
import 'package:envairo/view/pages/login_or_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_core/firebase_core.dart'; // new
import 'firebase_options.dart'; // new

Future main() async {
  final stopwatch = Stopwatch();
  stopwatch.start();
  print("stopwatch start ${stopwatch.elapsed}");

  WidgetsFlutterBinding.ensureInitialized();
  print("stopwatch WidgetsFlutterBinding ${stopwatch.elapsed}");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("stopwatch Firebase.initializeApp ${stopwatch.elapsed}");

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
                primaryColor: Color.fromARGB(255, 0, 118, 122),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialRoute: LoginOrSignup.route,
              onGenerateRoute: RouteGenerator().generateRoute,
            );
          }),
    );
  }
}
