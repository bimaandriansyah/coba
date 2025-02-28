// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/firebase_controller.dart';
import 'package:coba/screens/details_room_a.dart';
import 'package:coba/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final List<String> imgList = [
  'assets/purbaya1.png',
  'assets/purbaya2.jpg',
  'assets/purbaya3.jpg',
];

final List kamar = [
  {"tipe": "Tipe A", "harga": "350.000", "foto": "assets/room1.png"},
  {"tipe": "Tipe B", "harga": "220.000", "foto": "assets/room2.png"}
];

final List type = ["Type A", "Type B"];
final List harga = ["350.000", "225.000"];
final List fotoRoom = ["assets/room1.jpg", "assets/room2.jpg"];

final List namaTelaga = ["Telaga Sarangan", "Telaga Wahyu", "Bukit Mongkrang"];

final List<String> wisata = [
  'assets/telaga.jpg',
  'assets/telaga2.jpg',
  'assets/bukit.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
          ),
        ))
    .toList();

int currentCarousel = 0;

final CarouselController carouselController = CarouselController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [_header(), _carousel(), _body()],
        ),
      ),
    );
  }

  Widget _header() {
    final FirebaseController firebaseC = Get.find();
    final User? user = firebaseC.auth.currentUser;
    final String? username = user!.displayName;
    final String? photoUrl = user.photoURL;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("Selamat Datang",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              Text(username.toString(),
                  style: GoogleFonts.poppins(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          Spacer(),
          CircleAvatar(
            backgroundImage: NetworkImage(photoUrl.toString()),
            radius: 25,
          )
        ],
      ),
    );
  }

  Widget _carousel() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              child: CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                      height: Get.height * 0.2,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlayInterval: Duration(seconds: 7),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentCarousel = index;
                        });
                      }),
                  items: imageSliders),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentCarousel == entry.key
                          ? Colors.orange
                          : Colors.grey.shade400),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
              "Cari penawaran terbaik yang berkualitas pada Hotel Purbaya ...",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400)),
        ),
        _tipeKamar(),
        _wisata(),
      ],
    );
  }

  Widget _tipeKamar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Tipe Kamar",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: Get.height * 0.2,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: kamar.length,
              itemBuilder: (context, index) {
                return typeRoomCard(type, harga, fotoRoom, index);
              }),
        ),
      ],
    );
  }

  Widget typeRoomCard(List type, List harga, List fotoRoom, index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RoomDetailsPageA(), arguments: index);
        // print("dadada");
      },
      child: ClipRRect(
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
                      width: Get.width * 0.45,
                      child: Image.asset(
                        fotoRoom[index].toString(),
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
                        type[index],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "IDR " + harga[index],
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
      ),
    );
  }

  _wisata() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Wisata Terdekat",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Container(
              height: Get.width * 0.35,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: wisata.length,
                  itemBuilder: (context, index) {
                    return _listWisata(wisata, namaTelaga, index);
                  })),
        ),
      ],
    );
  }

  Widget _listWisata(List product, List nama, index) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: Get.width * 0.30,
                    height: 20,
                    child: Image.asset(
                      product[index].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  nama[index],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
