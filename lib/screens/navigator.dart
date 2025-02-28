// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/navigator_controller.dart';
import 'package:coba/screens/booking.dart';
import 'package:coba/screens/home_screen.dart';
import 'package:coba/screens/profile_screen.dart';
import 'package:coba/screens/reservation.dart';
import 'package:coba/screens/reservation_screen.dart';
import 'package:coba/screens/transaksi.dart';
import 'package:coba/screens/transfer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  final NavigatorController navigatorController =
      Get.put(NavigatorController());

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigatorController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: IndexedStack(
                  index: controller.tabIndex,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [HomeScreen(), ReservationPage(), ProfilePage()],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 9,
                currentIndex: controller.tabIndex,
                type: BottomNavigationBarType.fixed,
                onTap: controller.onChangeTab,
                enableFeedback: false,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  _bottomIcon("assets/home-fill.svg", "assets/home.svg"),
                  _bottomIcon(
                      "assets/shop-bag-fill.svg", "assets/shop-bag.svg"),
                  _bottomIcon("assets/profile-fill.svg", "assets/profile.svg"),
                ],
              ),
            ));
  }
}

_bottomIcon(String activeIcon, String icon) {
  return BottomNavigationBarItem(
      activeIcon: Container(
        height: 20,
        child: SvgPicture.asset(
          activeIcon,
        ),
      ),
      icon: Container(
        height: 20,
        child: SvgPicture.asset(
          icon,
        ),
      ),
      label: "");
}
