import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/firebase_controller.dart';
import 'package:coba/model/booking_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:images_picker/images_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

class NavigatorController extends GetxController {
  final FirebaseController firebaseC = Get.find();
  var tabIndex = 0;
  final hasNotification = false.obs;
  final countBadge = 0.obs;
  final dataBooking = <Booking>[].obs;
  Iterable<Booking> bookingBelum = [];
  Iterable<Booking> bookingSudah = [];
  Iterable<Booking> bookingBatal = [];

  CollectionReference data = FirebaseFirestore.instance.collection('booking');

  getbooking() {
    final User? user = firebaseC.auth.currentUser;
    data
        .doc(user!.uid)
        .collection("book")
        .get()
        .then((QuerySnapshot querySnapshot) {
      dataBooking.clear();
      for (var doc in querySnapshot.docs) {
        dataBooking.add(Booking(
            id: doc["id"],
            date: doc["date"],
            nama: doc["nama"],
            checkin: doc["checkin"],
            checkout: doc["checkout"],
            kodeUnik: doc["kodeUnik"],
            hari: doc["hari"],
            status: doc["status"],
            type: doc["type"],
            nominal: doc["nominal"],
            bukti: doc["bukti"]));
      }
      filterBooking();
    });
  }

  filterBooking() {
    bookingBelum = dataBooking
        .where((Booking value) => value.status.toString() == "belum bayar");
    bookingSudah = dataBooking
        .where((Booking value) => value.status.toString() == "sudah");
    bookingBatal = dataBooking
        .where((Booking value) => value.status.toString() == "batal");
    update();
  }

  void onChangeTab(int index) {
    tabIndex = index;
    update();
  }

  batalkanPesan(String id) {
    showLoading();
    CollectionReference data = FirebaseFirestore.instance.collection('booking');

    final User? user = firebaseC.auth.currentUser;

    data.doc(user!.uid).collection("book").doc(id).update({
      'status': "batal",
    }).then((value) {
      getbooking();
      Get.back();
      Get.back();
      onChangeTab(1);
    });
  }

  void onChooseAction(String id) {
    Get.bottomSheet(Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionButton(
            icon: Feather.camera,
            name: "Kamera",
            onTap: () {
              if (Get.isBottomSheetOpen ?? false) Get.back();
              captureImage(id);
            },
          ),
          actionButton(
            icon: Feather.image,
            name: "Galeri",
            onTap: () {
              if (Get.isBottomSheetOpen ?? false) Get.back();
              getImage(id);
            },
          ),
        ],
      ),
    ));
  }

  void captureImage(String id) async {
    await ImagesPicker.openCamera(
      language: Language.English,
      pickType: PickType.image,
      quality: 0.6,
      maxSize: 200,
      cropOpt: CropOption(
        aspectRatio: CropAspectRatio.custom,
        cropType: CropType.rect,
      ),
    ).then((value) {
      showLoading();
      if (value != null) {
        storage.Reference storageReference = storage.FirebaseStorage.instance
            .ref()
            .child('bukti/${value.first.path.split("/").last}}');
        storageReference.putFile(File(value.first.path)).then((_) {
          storageReference.getDownloadURL().then((url) {
            CollectionReference data =
                FirebaseFirestore.instance.collection('booking');

            final User? user = firebaseC.auth.currentUser;

            data.doc(user!.uid).collection("book").doc(id).update({
              'status': "sudah",
              'bukti': url,
            }).then((value) {
              getbooking();
              Get.back();
              Get.back();
              onChangeTab(1);
            });
          });
        });
      }
    });
  }

  static showLoading() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Mohon Tunggu...',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future getImage(String id) async {
    await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
      gif: false,
      quality: 0.6,
      maxSize: 200,
      language: Language.English,
      cropOpt: CropOption(
        aspectRatio: CropAspectRatio.custom,
        cropType: CropType.rect,
      ),
    ).then((value) async {
      showLoading();
      if (value != null) {
        storage.Reference storageReference = storage.FirebaseStorage.instance
            .ref()
            .child('bukti/${value.first.path.split("/").last}}');
        storageReference.putFile(File(value.first.path)).then((_) {
          storageReference.getDownloadURL().then((url) {
            CollectionReference data =
                FirebaseFirestore.instance.collection('booking');

            final User? user = firebaseC.auth.currentUser;

            data.doc(user!.uid).collection("book").doc(id).update({
              'status': "sudah",
              'bukti': url,
            }).then((value) {
              getbooking();
              Get.back();
              Get.back();
              onChangeTab(1);
            });
          });
        });
      }
    });
  }

  @override
  void onInit() {
    getbooking();
    super.onInit();
  }
}

class actionButton extends StatelessWidget {
  const actionButton({
    Key? key,
    required this.name,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String name;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 80,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
