import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_firestore_app/pages/greeting_page.dart';
import 'package:firebase_firestore_app/pages/home_page.dart';
import 'package:firebase_firestore_app/pages/login_page.dart';
import 'package:firebase_firestore_app/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error initializing Firebase'),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Firestore App',
              home: GreetingPage(),
              routes: {
                '/greeting': (context) => const GreetingPage(),
                '/signup': (context) => SignupPage(),
                '/home': (context) => const HomePage(),
                '/login': (context) => LoginPage(),
              },
            );
          }
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
    );
  }
}