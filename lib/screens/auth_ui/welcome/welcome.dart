import 'package:amorena_app/constants/assets_images.dart';
import 'package:amorena_app/constants/routes.dart';
import 'package:amorena_app/screens/auth_ui/login/login.dart';
import 'package:amorena_app/widgets/primary_button/primary_button.dart';
import 'package:amorena_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                subtitle: "Buy Any Perfume From Using App", title: "Welcome "),
            Center(
              child: Image.asset(
                AsstsImages.instance.welcomeImage,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.facebook,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AsstsImages.instance.googleLogo,
                    scale: 125.0,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
            ),
            const SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              title: "Sign Up",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
