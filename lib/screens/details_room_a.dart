// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/booking_controller.dart';
import 'package:coba/controller/navigator_controller.dart';
import 'package:coba/screens/booking.dart';
import 'package:coba/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomDetailsPageA extends StatelessWidget {
  RoomDetailsPageA({Key? key}) : super(key: key);
  static const String path = "lib/screens/details_room.dart";
  final String image = "assets/hotel/room2.jpg";

  final List type = ["Type A", "Type B"];
  final List harga = ["350000", "225000"];
  final List fotoRoom = ["assets/room1.jpg", "assets/room2.jpg"];
  final List bed = ["1 Bed", "2 Bed"];

  final List detail = [
    "Kamar ini lebih ditujukan kepada perseorangan, dengan fasilitas TV, Wifi, Kamar Mandi Dalam, Free Wifi sehingga dapat menambah kenyamanan customer dalam menggunakan kamar ini.",
    "Kamar ini lebih ditujukan kepada pasangan , dengan fasilitas TV, Wifi, Kamar Mandi Dalam, Free Wifi sehingga dapat menambah kenyamanan customer dalam menggunakan kamar ini.",
  ];

  int nomor = Get.arguments;

  final bookingController = Get.put(BookingController());
  final NavigatorController navC = Get.find();

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
                          fotoRoom[nomor],
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
                              type[nomor],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "IDR " + harga[nomor],
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
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w600),
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
                                          bed[nomor],
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
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
                                    detail[nomor],
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
                            ),
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
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 30,
                                  height: 5,
                                ),
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {}, child: _checkIn(context)),
                                  GestureDetector(
                                      onTap: () {}, child: _checkOut(context)),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  navC.getbooking();
                                  bookingController.addbooking(
                                      type[nomor], "belum bayar", harga[nomor]);
                                  Get.off(() => BookingPage(), arguments: [
                                    bookingController.jumlah.toString(),
                                    harga[nomor],
                                    bookingController.idBook,
                                    "belum bayar",
                                    "",
                                    bookingController.selectedDate1.value,
                                    bookingController.selectedDate2.value
                                  ]);
                                },
                                child: Text(
                                  "BOOKING",
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
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        elevation: 20.0,
                        isScrollControlled: true,
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

  Widget _checkIn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bookingController.selectDate(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() => Text(
                    bookingController.selectedDate1.value,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 13),
                  )),
            ),
            Icon(
              Feather.calendar,
              color: Colors.black.withOpacity(0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkOut(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bookingController.selectDate2(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() => Text(
                    bookingController.selectedDate2.value,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 13),
                  )),
            ),
            Icon(
              Feather.calendar,
              color: Colors.black.withOpacity(0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
