import 'dart:async';

import 'package:amorena_app/constants/theme.dart';
import 'package:amorena_app/screens/auth_ui/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCENT',
      theme: themeData,
      home: const Welcome(),
    );
  }
}
