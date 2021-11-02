// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter/material.dart';

class CobaAja extends StatefulWidget {
  const CobaAja({Key? key}) : super(key: key);

  @override
  _CobaAjaState createState() => _CobaAjaState();
}

class _CobaAjaState extends State<CobaAja> {
  // Form
  final _formKey = GlobalKey<FormState>();

  // Edit Conttroller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade800,
                Colors.orange.shade600,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/logo-putih.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "m",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "Purbaya",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                  child: Text(
                                    "Atau login dengan :",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade200),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesome.google_plus,
                                              color: Colors.orange,
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Google",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
