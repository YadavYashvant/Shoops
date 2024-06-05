import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:firebase_firestore_app/constants/colors.dart';
import 'package:firebase_firestore_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.light, // white status bar icons
    ));
    return Scaffold(
      backgroundColor: blackColor,
      /*appBar: AppBar(
        backgroundColor: Colors.amberAccent[400],
        // centerTitle: true,
        title: const Text('Sign In'),
      ),*/
      body: Padding(
        padding: EdgeInsets.all(getScreenWidth(context)*0.03),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Card(
                  surfaceTintColor: darkGreyColor,
                  color: midGreyColor,
                  child: Padding(
                    padding: EdgeInsets.all(getScreenWidth(context)*0.05),
                    child: Column(
                      children: [
                  Text(
                  'Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      color: Colors.white,
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
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        labelText: 'Email',
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
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 20)
                      ]
                  )
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onPressed: () {
                    signIn(context);
                    Navigator.pushNamed(context, '/home');
                  },
                  btnheight: 70,
                  btnwidth: getScreenWidth(context)*.8,
                  text: 'Sign In',
                  fsize: 26,
                ),

                const SizedBox(height: 40)
              ],
          ),
        ),
    );
  }
}