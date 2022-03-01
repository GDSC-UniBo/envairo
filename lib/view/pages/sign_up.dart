import 'package:envairo/view/widgets/round_button.dart';
import 'package:envairo/view/widgets/textbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import 'login.dart';

class SignUp extends StatelessWidget {

  static const String route = '/signup';

  const SignUp({Key? key}) : super(key: key);

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
            hintText: "Full name",
            keyboardType: TextInputType.name,
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
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                buttonColor: Theme.of(context).primaryColor,
                onTap: onTapSignUp,
              ),
            ),
          ),
          Row(
              children: const [
                Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 50,
                      endIndent: 20,
                      height: 40,
                    )
                ),

                Text("or"),

                Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 20,
                      endIndent: 50,
                      height: 40,
                    )
                ),
              ]
          )
          ,
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
                buttonColor: Theme.of(context).primaryColor,
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
                buttonColor: Theme.of(context).primaryColor,
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
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          onTapTOS();
                        }),
                  const TextSpan(
                    text: " and ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        onTapPP();
                      },
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
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

  void onTapSignUp() {
    //TODO
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

  void onTapToLogIn(context) {
    Navigator.pushReplacement(
      context,
      RouteGenerator().generateRoute(const RouteSettings(name: LogIn.route)),
    );
  }
}
