import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is signed in, navigate to HomePage
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
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
        centerTitle: true,
        backgroundColor: Colors.amberAccent[400],
        title: const Text('Gym App'),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
                'assets/animations/shopping.json',
                width: getScreenWidth(context) * 0.8,
                height: getScreenheight(context) * 0.4,
                fit: BoxFit.fill,
                animate: true,
            ),

            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Container(
                width: getScreenWidth(context) * 0.78,
                margin: EdgeInsets.only(left: getScreenWidth(context) * 0.05,),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getScreenWidth(context) * 0.1,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Proceed to \n',
                            style: GoogleFonts.poppins(
                                color: greenColor,
                                fontSize:36,
                                fontWeight: FontWeight.bold
                            )),
                        TextSpan(
                            text: 'Our Store !', style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ))
                      ]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              btnwidth: getScreenWidth(context) * 0.78,
              btnheight: getScreenheight(context) * 0.07,
              text: 'Login or Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}