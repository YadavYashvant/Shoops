import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:firebase_firestore_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("User signed up: ${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.light, // white status bar icons
    ));
    return Scaffold(
      backgroundColor: blackColor,
      /*appBar: AppBar(
        backgroundColor: blackColor,
        // title: const Text('Sign Up'),
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: midGreyColor,
                elevation: 10,
                shadowColor: brightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        cursorColor: Colors.white,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        cursorColor: Colors.white,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        onPressed: signUp,
                        text: 'Sign Up',
                        btnheight: 60,
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            Text(
              'Already have an account? 🤙',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              btnheight: 50,
              btnwidth: 240,
              color: Colors.green,
              bgcolor: Colors.amberAccent,
              text: 'Go to Login Page',
            ),
          ],

        ),
      ),
    );
  }
}
/*
import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      // Navigator.pushNamed(context, '/home');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[400],
        title: const Text('Sign Up'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.grey[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {

                      },
                      text: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          const Text(
            'Already have an account? 🤙',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            btnheight: 50,
            btnwidth: 240,
            color: Colors.green,
            bgcolor: Colors.amberAccent,
            text: 'Go to Login Page',
          ),
        ],

      ),
    );
  }
}*/
