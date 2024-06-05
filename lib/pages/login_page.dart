import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Hey!! 🥳',
          message:
          "User signed in: ${userCredential.user}",
          contentType: ContentType.success,
          // to configure for material banner
          inMaterialBanner: false,
        )
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Oh Hey!! 🥳',
            message:
            "The password provided is too weak.",
            contentType: ContentType.failure,
            // to configure for material banner
            inMaterialBanner: false,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        // print('The password provided is too weak.');
      }
    } catch (e) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Hey!! 🥳',
          message:
          "An error occurred while signing in.",
          contentType: ContentType.failure,
          // to configure for material banner
          inMaterialBanner: false,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[400],
        // centerTitle: true,
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    signIn(context);
                    Navigator.pushNamed(context, '/home');
                  },
                  text: 'Sign In',
                ),

                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
    );
  }
}