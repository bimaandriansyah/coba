import 'package:flutter/material.dart';

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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Reservation"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
        ],
      ),
    );
  }
}
