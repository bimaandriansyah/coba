// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/firebase_controller.dart';
import 'package:coba/controller/navigator_controller.dart';
import 'package:coba/screens/login_screen.dart';
import 'package:coba/screens/transfer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseController firebaseC = Get.find();
    final NavigatorController navC = Get.find();
    final User? user = firebaseC.auth.currentUser;
    final String? username = user!.displayName;
    final String? email = user.email;
    final String? photoUrl = user.photoURL;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              iconSize: 30,
              padding: EdgeInsets.only(right: 15),
              onPressed: () {
                // firebaseC.logout();
                // navC.tabIndex = 0;
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: AppColors.backgroundColor,
            child: Stack(
              children: <Widget>[
                Container(
                  height: Get.height * 0.2 - 27,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(photoUrl.toString()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(username.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                        Text(email.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "",
                        backgroundColor: Colors.white,
                        content: Column(
                          children: [
                            Center(
                              child: Text(
                                "Yakin ingin logout dari akun ini?",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(10),
                                            elevation: 0,
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        child: Text("Cancel",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          firebaseC.logout();
                                          navC.tabIndex = 0;
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(10),
                                            elevation: 0,
                                            primary: AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        child: Text("Logout",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                  child: Text(
                    "LOGOUT",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.red.shade500,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // return Scaffold(
  //     backgroundColor: AppColors.backgroundColor,
  //     appBar: AppBar(
  //       backgroundColor: AppColors.primaryColor,
  //       centerTitle: true,
  //       toolbarHeight: Get.height * 0.1,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
  //       title: Stack(
  //         children: <Widget>[
  //           Container(
  //             width: Get.width,
  //             color: AppColors.primaryColor,
  //           ),
  //           Text(
  //             'Profile',
  //             style: GoogleFonts.poppins(
  //                 color: Colors.white, fontWeight: FontWeight.w600),
  //           ),
  //         ],
  //       ),
  //       actions: <Widget>[
  //         IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               Icons.exit_to_app,
  //               color: Colors.white,
  //             )),
  //       ],
  //       // leading: Builder(
  //       //   builder: (BuildContext context) {
  //       //     return IconButton(
  //       //         onPressed: () {}, icon: Icon(Icons.exit_to_app));
  //       //   },
  //       // ),
  //     ),
  //     body: SafeArea(
  //         child: Column(children: [
  //       Container(
  //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //           padding: EdgeInsets.all(25),
  //           decoration: BoxDecoration(
  //               color: Colors.grey.shade100,
  //               borderRadius: BorderRadius.all(Radius.circular(10)),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.withOpacity(0.5),
  //                   blurRadius: 5,
  //                 )
  //               ]),
  //           child: Column(
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(50),
  //                     boxShadow: [
  //                       BoxShadow(
  //                           offset: Offset(0, 3),
  //                           blurRadius: 10,
  //                           color: AppColors.primaryColor.withOpacity(0.5))
  //                     ]),
  //                 child: CircleAvatar(
  //                   radius: 50,
  //                   backgroundImage: NetworkImage(photoUrl.toString()),
  //                 ),
  //               ),
  //               Text(username.toString(),
  //                   style: GoogleFonts.poppins(
  //                       color: Colors.black,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold)),
  //               Text(email.toString(),
  //                   style: GoogleFonts.poppins(
  //                     color: Colors.black,
  //                     fontSize: 15,
  //                   )),
  //             ],
  //           )),
  //       // Container(
  //       //   margin: EdgeInsets.only(bottom: 20),
  //       //   height: sizeHeigh * 0.2,
  //       //   child: Stack(
  //       //     children: [
  //       //       Container(
  //       //         padding: EdgeInsets.only(
  //       //             left: 20, right: 20, bottom: 20, top: 20 + 20),
  //       //         height: sizeHeigh * 0.2 - 50,
  //       //         decoration: BoxDecoration(
  //       //           color: AppColors.lightGrey,
  //       //         ),
  //       //       ),
  //       //       Positioned(
  //       //           bottom: 0,
  //       //           right: Get.width / 2 - 50,
  //       //           left: Get.width / 2 - 50,
  //       //           child: Container(
  //       //             padding: EdgeInsets.all(3),
  //       //             height: 100,
  //       //             width: 100,
  //       //             decoration: BoxDecoration(
  //       //                 color: Colors.white,
  //       //                 borderRadius: BorderRadius.circular(50),
  //       //                 boxShadow: [
  //       //                   BoxShadow(
  //       //                       offset: Offset(0, 3),
  //       //                       blurRadius: 10,
  //       //                       color: Colors.grey.withOpacity(0.3))
  //       //                 ]),
  //       //             child: CircleAvatar(
  //       //                 backgroundImage: NetworkImage(photoUrl.toString())),
  //       //           ))
  //       //     ],
  //       //   ),
  //       // ),

  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Divider(
  //               height: 4,
  //               thickness: 1,
  //               color: AppColors.grey,
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Text("No Hp",
  //                 style: GoogleFonts.poppins(
  //                   color: Colors.black,
  //                   fontSize: 15,
  //                 )),
  //             Text(noHp.toString(),
  //                 style: GoogleFonts.poppins(
  //                     color: Colors.black,
  //                     fontSize: 17,
  //                     fontWeight: FontWeight.bold)),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 firebaseC.logout();
  //                 navC.tabIndex = 0;
  //               },
  //               child: Text(
  //                 "LOGOUT",
  //                 style: GoogleFonts.poppins(
  //                     fontSize: 16,
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   primary: Colors.red.shade500,
  //                   padding:
  //                       EdgeInsets.symmetric(horizontal: 30, vertical: 13),
  //                   textStyle:
  //                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //             ),
  //           ],
  //         ),
  //       )
  //     ])));

}
