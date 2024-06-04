import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore_app/components/custom_btn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/greeting');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[400],
        centerTitle: true,
        title: Text('Gym App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => signOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: ListView(
          children: [
            /*
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  
                  // return Card(
                  //   color: Colors.lightGreen,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Text('Card $index'),
                  //   ),
                  // );

                  return Container(
                    width: 100,
                    height: 50,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text('Card $index'),
                    ),
                  );

                }),
              ),
            ),
            */
            const SizedBox(
              height: 18,
            ),
            ...List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: Colors.greenAccent[200],
                  child: SizedBox(
                    width: 250,
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[500],
                            radius: 108,
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://ecommercephotographyindia.com/blog/wp-content/uploads/2022/07/beauty-products-1.jpg"), //NetworkImage
                              radius: 100,
                            ), //CircleAvatar
                          ), //CircleAvatar
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          Text(
                            'Item $index',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[900],
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          const Text(
                            'Description of the item goes here.',
                            style: TextStyle(
                              fontSize: 15,
                              // color: Colors.green,
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          CustomButton(
                            btnheight: 40,
                            onPressed: (){},
                            text: "Check")
                          // SizedBox(
                          //   width: 100,

                          //   child: ElevatedButton(
                          //     onPressed: () => 'Null',
                          //     style: ButtonStyle(
                          //         backgroundColor:
                          //             MaterialStateProperty.all(Colors.green)),
                          //     child: const Padding(
                          //       padding: EdgeInsets.all(4),
                          //       child: Row(
                          //         children: [
                          //           Icon(Icons.touch_app),
                          //           Text('Visit')
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          //   // RaisedButton is deprecated and should not be used
                          //   // Use ElevatedButton instead

                          //   // child: RaisedButton(
                          //   //   onPressed: () => null,
                          //   //   color: Colors.green,
                          //   //   child: Padding(
                          //   //     padding: const EdgeInsets.all(4.0),
                          //   //     child: Row(
                          //   //       children: const [
                          //   //         Icon(Icons.touch_app),
                          //   //         Text('Visit'),
                          //   //       ],
                          //   //     ), //Row
                          //   //   ), //Padding
                          //   // ), //RaisedButton
                          // ) //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox

                        ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
