import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore_app/components/primary_btn.dart';
import 'package:firebase_firestore_app/constants/colors.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/greeting');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.light, // white status bar icons
    ));
    return Scaffold(
      backgroundColor: blackColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('items').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }

                      return ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Container(
                                  width: getScreenWidth(context) * 0.68,
                                  margin: EdgeInsets.only(left: getScreenWidth(context) * 0.05, top: getScreenheight(context) * 0.02,),
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
                                              text: "Welcome ",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.amberAccent,
                                                fontWeight: FontWeight.bold

                                              ))
                                        ]),
                                  ),
                                ),
                              ),// Empty container to take up space
                              IconButton(
                                onPressed: () {
                                  signOut(context);
                                },
                                icon: const Icon(Icons.logout, color: Colors.white, size: 30),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Container(
                              width: getScreenWidth(context) * 0.68,
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
                                          text: 'To Our Grocery\n',
                                          style: GoogleFonts.poppins(
                                              color: greenColor,
                                              fontSize:36,
                                              fontWeight: FontWeight.bold
                                          )),
                                      TextSpan(text: 'Store', style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                      ))
                                    ]),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ...snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                            return Column(
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  // surfaceTintColor: Colors.greenAccent,
                                  color: midGreyColor,
                                  child: Column(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Ink.image(
                                              image: NetworkImage(data['imageurl']),
                                              fit: BoxFit.cover,
                                              height: 240,
                                              child: Container(
                                                color: Colors.black.withOpacity(0.6),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  data['name'],
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.amberAccent,
                                                    fontSize: 48,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '\₹ ${data['price']}',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.greenAccent,
                                                      fontSize: 36,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.shopping_bag_outlined,
                                              color: greenColor,
                                            ),
                                            const SizedBox(width: 60),

                                            CustomButton(
                                              onPressed: () {
                                                SnackBar snackBar = SnackBar(
                                                  content: Text('Added to cart'),
                                                  action: SnackBarAction(
                                                    label: 'Undo',
                                                    onPressed: () {
                                                      print('Undo');
                                                    },
                                                  ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                  ..hideCurrentSnackBar()
                                                  ..showSnackBar(snackBar);
                                              },
                                              text: 'Add to cart',
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }).toList(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}