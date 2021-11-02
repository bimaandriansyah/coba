// ignore_for_file: unused_field, unused_local_variable, prefer_const_constructors

import 'package:coba/screens/home_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba/model/user_model.dart';
import 'package:coba/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  //edit controller
  final namaLengkapController = TextEditingController();
  final emailController = TextEditingController();
  final noHPController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordKonfirmasiController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
//Nama Lengkap
    final namaLengkapField = TextFormField(
      autofocus: false,
      controller: namaLengkapController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Nama tidak boleh kosong !");
        }
        return null;
      },
      onSaved: (value) {
        namaLengkapController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.people),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nama Lengkap",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//Email Lengkap
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Email tidak boleh kosong ! ");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return (" Masukan email yang valid !");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//No. HP Lengkap
    final noHPField = TextFormField(
      autofocus: false,
      controller: noHPController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("No. HP tidak boleh kosong ! ");
        }
        return null;
      },
      onSaved: (value) {
        noHPController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "No. HP",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//Password
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password harus diisi !");
        }
        if (!regex.hasMatch(value)) {
          return ("Password tidak valid ! (Min. 6 karakter) ");
        }
      },
      onSaved: (value) {
        namaLengkapController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//Konfirmasi Password
    final passwordKonfirmasiField = TextFormField(
      autofocus: false,
      controller: passwordKonfirmasiController,
      obscureText: true,
      validator: (value) {
        if (passwordKonfirmasiController.text.length > 6 &&
            passwordKonfirmasiController.text != passwordController.text) {
          return ("Password tidak sama !");
        }
        return null;
      },
      onSaved: (value) {
        passwordKonfirmasiController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Konfirmasi Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//Register Button
    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.orange,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text("DAFTAR",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "DAFTAR",
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
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              namaLengkapField,
                              SizedBox(height: 20),
                              emailField,
                              SizedBox(height: 20),
                              noHPField,
                              SizedBox(height: 20),
                              passwordField,
                              SizedBox(height: 20),
                              passwordKonfirmasiField,
                              SizedBox(height: 40),
                              registerButton,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: 20,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sudah punya akun?",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        },
                                        child: Text(
                                          " Masuk",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // panggil firestore, usermdeo, value
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email!;
    userModel.uid = user.uid;
    userModel.nama = namaLengkapController.text;
    userModel.noHP = noHPController.text as int;
    userModel.password = passwordController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Akun berhasil dibuat !");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
  }
}
