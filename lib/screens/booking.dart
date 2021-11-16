// ignore_for_file: prefer_const_constructors

import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/booking_controller.dart';
import 'package:coba/controller/firebase_controller.dart';
import 'package:intl/intl.dart';
import 'package:coba/screens/transfer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatelessWidget {
  final BookingController bookingController = Get.find();
  NumberFormat output =
      NumberFormat.currency(locale: "in", symbol: "", decimalDigits: 0);

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Booking',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        centerTitle: true,
      ),
      body: _body(),
      // bottomNavigationBar: _bookingMenu(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _menuContent(),
                _detailBooking(),
                _buktiPembayaran(),
                // z
              ],
            ),
          ),
        ),
        _bookingMenu()
      ],
    );
  }

  Widget _menuContent() {
    final FirebaseController firebaseC = Get.find();
    final User? user = firebaseC.auth.currentUser;
    final String? username = user!.displayName;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(username.toString(),
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _detailBooking() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: AppColors.lightGrey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Periode",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "${data[0]} Malam",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Harga",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "${output.format(int.parse(data[1]))}",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade400,
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "IDR ${output.format(data[0] * int.parse(data[1]))}",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buktiPembayaran() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bukti Pembayaran",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              color: AppColors.lightGrey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Feather.file),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Upload Bukti Pembayaran",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bookingMenu() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                "Total Bayar",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "IDR ${output.format(data[0] * int.parse(data[1]))}",
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Spacer(),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => TransferPage());
              },
              child: Text(
                "BAYAR",
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bukti Pembayaran",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              color: AppColors.lightGrey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Feather.file),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Upload Bukti Pembayaran",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
