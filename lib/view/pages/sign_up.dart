import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../src/authentication.dart';
import '../widgets/round_button.dart';
import '../widgets/textbox.dart';
import 'login.dart';
import 'main_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String route = '/signup';

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUp> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Image.asset(
            "assets/images/logo.png",
            scale: 1.5,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextBox(
            hintText: "Full name",
            keyboardType: TextInputType.name,
            controller: fullNameController,
          ),
          MyTextBox(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          MyTextBox(
            hintText: "Password",
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              height: 40,
              child: RoundButton(
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).secondaryHeaderColor,
                onTap: onTapSignUp,
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
                    "Sign up with Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).secondaryHeaderColor,
                onTap: onTapSignUpFacebook,
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
                    "Sign up with Google",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).secondaryHeaderColor,
                onTap: onTapSignUpGoogle,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 16),
                children: [
                  const TextSpan(
                    text: "By signing up you accept the ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                      recognizer: TapGestureRecognizer()..onTap = onTapTOS),
                  const TextSpan(
                    text: " and ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()..onTap = onTapPP,
                  ),
                ],
              ),
            ),
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
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Log in",
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        onTapToLogIn(context);
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

  Future onTapSignUp() async {
    if (kDebugMode) {
      String fullName = fullNameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      print("SIGNUP_TEST $fullName $email $password");
    }

    if (fullNameController.text.isNotEmpty) {
      AuthenticationHelper()
          .signUp(
              email: emailController.text,
              password: passwordController.text,
              fullName: fullNameController.text)
          .then((result) {
        if (result == null) {
          if (kDebugMode) {
            var userFullName = AuthenticationHelper().user.displayName;
            print("SIGNUP_TEST successful with display name $userFullName");
          }
          openMainPage(context);
        } else {
          if (kDebugMode) {
            print("SIGNUP_TEST Unsuccessful $result");
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              result,
              style: const TextStyle(fontSize: 16),
            ),
          ));
        }
      });
    }
  }

  void onTapSignUpFacebook() {
    //TODO
  }

  void onTapSignUpGoogle() {
    //TODO
  }

  void onTapTOS() {
    //TODO
  }

  void onTapPP() {
    //TODO
  }

  void openMainPage(context) =>
      Navigator.pushReplacementNamed(context, MainPage.route);

  void onTapToLogIn(context) =>
      Navigator.pushReplacementNamed(context, LogIn.route);
}
