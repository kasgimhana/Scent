// ignore_for_file: use_build_context_synchronously

import 'package:amorena_app/constants/constants.dart';
import 'package:amorena_app/constants/routes.dart';
import 'package:amorena_app/firebase_helper/firebase_auth_helper/firebase_firestore/firebase_auth_helper.dart';
import 'package:amorena_app/screens/auth_ui/home/home.dart';
import 'package:amorena_app/screens/auth_ui/sign_up/signup.dart';
import 'package:amorena_app/widgets/primary_button/primary_button.dart';
import 'package:amorena_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(subtitle: "Grag Your Perfume", title: "Login"),
            const SizedBox(
              height: 46.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.mail_outlined,
                  )),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                ),
                suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const Icon(Icons.visibility)),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () async {
                bool isVaildated = loginVaildation(email.text, password.text);
                if (isVaildated) {
                  bool isLogined = await FirebaseAuthHelper.instance
                      .login(email.text, password.text, context);
                  if (isLogined) {
                    Routes.instance.pushAndRemoveUntill(
                        widget: const Home(), context: context);
                  }
                }
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Center(child: Text("Don't have an account?")),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: CupertinoButton(
                onPressed: () {
                  Routes.instance
                      .push(widget: const SignUp(), context: context);
                },
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
