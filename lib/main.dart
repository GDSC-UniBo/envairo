import 'package:envairo/repositories/item_repository.dart';
import 'package:envairo/repositories/user_repository.dart';
import 'package:envairo/router.dart';
import 'package:envairo/view/pages/login_or_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


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

  runApp(MultiProvider(
      providers: [
        RepositoryProvider(create: (context) => ItemRepository()),
        RepositoryProvider(create: (context) => UserRepository()),
      ],
      child: const MyApp()
  )
  );
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
              title: 'FreebBye',
              theme: ThemeData(
                primaryColor: const Color.fromARGB(255, 0, 118, 122),
                secondaryHeaderColor: const Color.fromARGB(255, 107, 205, 165),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialRoute: LoginOrSignup.route,
              onGenerateRoute: RouteGenerator().generateRoute,
            );
          }
          ),
    );
  }
}
