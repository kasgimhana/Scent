import 'package:amorena_app/constants/routes.dart';
import 'package:amorena_app/screens/auth_ui/home/home.dart';
import 'package:amorena_app/widgets/primary_button/primary_button.dart';
import 'package:amorena_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  subtitle: "Welcome To Scent Store", title: "Create Account"),
              const SizedBox(
                height: 46.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person_outlined,
                    )),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone_No",
                    prefixIcon: Icon(
                      Icons.phone_outlined,
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
                title: "Create an account",
                onPressed: () {
                  Routes.instance.pushAndRemoveUntill(
                      widget: const Home(), context: context);
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Center(child: Text("I have already an account?")),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
