import 'package:fidity/home/home.dart';
import 'package:fidity/onboarding/onboarding_page.dart';
import 'package:fidity/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Fidity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: auth.currentUser != null ? const Home() : const OnboardingPage()
    );
  }
}
