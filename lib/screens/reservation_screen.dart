// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> kamar = [
  'assets/room1.jpg',
];

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // ignore: prefer_const_constructors
            title: Text(
              'Transaksi Booking',
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            elevation: 0,
            // ignore: prefer_const_constructors
            bottom: TabBar(
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              isScrollable: false,
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Belum Bayar', style: GoogleFonts.poppins()),
                ),
                Text('Sudah Dibayar', style: GoogleFonts.poppins()),
                Text('Dibatalkan', style: GoogleFonts.poppins()),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  ),
                  SizedBox(
                    height: Get.height * 0.3,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: kamar.length,
                        itemBuilder: (context, index) {
                          return typeRoomCard(kamar, index);
                        }),
                  ),
                ],
              ),
              Text('Sudah Bayar'),
              Text('Dibatalkan'),
            ],
          ),
        ),
      ),
    );
  }

  Widget typeRoomCard(List product, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    child: Image.asset(
                      product[index].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipe A",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "IDR 350.000 ",
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: Colors.orange),
                        ),
                        Text(
                          "/ Malam",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
