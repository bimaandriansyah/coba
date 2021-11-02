// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:coba/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 9,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (newValue) {
          setState(() {
            currentIndex = newValue;
          });
        },
        items: [
          _bottomIcon("assets/home-fill.svg", "assets/home.svg"),
          _bottomIcon("assets/shop-bag-fill.svg", "assets/shop-bag.svg"),
          _bottomIcon("assets/profile.svg", "assets/profile.svg"),
        ],
      ),
    );
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
