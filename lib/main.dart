// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:ui';

import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/firebase_controller.dart';
import 'package:coba/screens/login_screen.dart';
import 'package:coba/screens/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final firebaseC = Get.put(FirebaseController());

  late GoogleSignIn signIn;

  late User user;

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ));
    return StreamBuilder<User?>(
      stream: firebaseC.authStatus(),
      builder: (context, snapshot) {
        return GetMaterialApp(
          title: 'mPurbaya',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          debugShowCheckedModeBanner: false,
          home: snapshot.data != null ? MainPage() : LoginScreen(),
        );
      },
    );
  }
}
