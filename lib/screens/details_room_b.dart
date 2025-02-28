// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coba/constant/color_constant.dart';
import 'package:coba/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomDetailsPageB extends StatelessWidget {
  RoomDetailsPageB({Key? key}) : super(key: key);
  static const String path = "lib/screens/details_room.dart";
  final String image = "assets/hotel/room2.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Detail Kamar',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.25,
                        child: Image.asset(
                          "assets/room1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 18, 0, 20),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "Tipe B",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "IDR 250.000 ",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "/ Malam",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: Get.width,
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Spesifikasi Kamar",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          child: SvgPicture.asset(
                                              "assets/bed.svg"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "1 Bed",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          child: SvgPicture.asset(
                                              "assets/bath.svg"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "1 Bathroom",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            child: Text(
                              "Fasilitas",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w600),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        color: Colors.grey.shade200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child:
                                              SvgPicture.asset("assets/tv.svg"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        color: Colors.grey.shade200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                              "assets/coffee.svg"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        color: Colors.grey.shade200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                              "assets/wifi.svg"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    child: Text(
                                      "Detail",
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    alignment: Alignment.topLeft,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 30),
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                right: 20,
                left: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                                child: Container(
                                  color: Colors.grey.shade300,
                                  width: 30,
                                  height: 5,
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: checkInField,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: checkOutField,
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "SELANJUTNYA",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: Colors.orange,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 13),
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                        elevation: 20.0,
                        enableDrag: true,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        )));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  child: Text("BOOKING SEKARANG"),
                ))
          ],
        ),
      ),
    );
  }

  final checkInField = TextFormField(
    autofocus: false,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value!.isEmpty) {
        return ("Tanggal harus diisi ! ");
      }
      return null;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      suffix: const Icon(Feather.calendar),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Check In",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  final checkOutField = TextFormField(
    autofocus: false,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value!.isEmpty) {
        return ("Tanggal harus diisi ! ");
      }
      return null;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      suffix: const Icon(Feather.calendar),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Check Outtt",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
