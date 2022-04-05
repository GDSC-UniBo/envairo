import 'package:envairo/view/pages/item_details.dart';
import 'package:envairo/view/pages/chat_view.dart';
import 'package:envairo/view/pages/login.dart';
import 'package:envairo/view/pages/login_or_signup.dart';
import 'package:envairo/view/pages/main_page.dart';
import 'package:envairo/view/pages/sign_up.dart';
import 'package:envairo/view/pages/user_profile.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator();

  final Map<String, Widget Function(BuildContext, dynamic)> _routes = {
    MainPage.route: (context, _) => const MainPage(),
    LogIn.route: (context, _) => const LogIn(),
    SignUp.route: (context, _) => const SignUp(),
    LoginOrSignup.route: (context, _) => const LoginOrSignup(),
    ChatView.route: (context, _) => const ChatView(),
    UserProfile.route: (context, user) => UserProfile(user: user),
    ItemDetails.route: (context, item) => ItemDetails(item: item),
  };

  Route<dynamic> generateRoute(RouteSettings settings) {
    Widget Function(BuildContext, dynamic)? pageBuilder =
        _routes[settings.name!];
    if (pageBuilder != null) {
      return MaterialPageRoute(
          settings: settings,
          builder: (context) => pageBuilder(context, settings.arguments));
    }

    throw Exception("Route ${settings.name} doesn't exists");
  }
}
