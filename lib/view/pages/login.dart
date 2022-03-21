import 'package:envairo/router.dart';
import 'package:envairo/view/pages/main_page.dart';
import 'package:envairo/view/pages/sign_up.dart';
import 'package:envairo/view/widgets/round_button.dart';
import 'package:envairo/view/widgets/textbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  static const String route = '/login';

  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Image.network(
            "https://a1auto.sfo2.cdn.digitaloceanspaces.com/assets/logo-placeholder.png",
            scale: 1.5,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextBox(
            key: key,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          MyTextBox(
            key: key,
            hintText: "Password",
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              height: 40,
              child: RoundButton(
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).primaryColor,
                onTap: () => onTapLogIn(context),
              ),
            ),
          ),
          Row(children: const [
            Expanded(
                child: Divider(
              thickness: 1,
              color: Colors.black,
              indent: 50,
              endIndent: 20,
              height: 40,
            )),
            Text("or"),
            Expanded(
                child: Divider(
              thickness: 1,
              color: Colors.black,
              indent: 20,
              endIndent: 50,
              height: 40,
            )),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              height: 40,
              child: RoundButton(
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log in with Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).primaryColor,
                onTap: () => onTapLogIn(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              height: 40,
              child: RoundButton(
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log in with Google",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).primaryColor,
                onTap: () => onTapLogIn(context),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16),
                children: [
                  const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        onTapToSignUp(context);
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapLogIn(context) {
    openMainPage(context);
  }

  void onTapLogInFacebook() {
    //TODO
  }

  void onTapLogInGoogle() {
    //TODO
  }

  void openMainPage(context) {
    Navigator.pushReplacement(
      context,
      RouteGenerator().generateRoute(const RouteSettings(name: MainPage.route)),
    );
  }

  void onTapToSignUp(context) {
    Navigator.pushReplacement(
      context,
      RouteGenerator().generateRoute(const RouteSettings(name: SignUp.route)),
    );
  }
}
