import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba/constant/color_constant.dart';
import 'package:coba/controller/firebase_controller.dart';
import 'package:coba/model/booking_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  final FirebaseController firebaseC = Get.find();
  DateTime date = DateTime.now();
  var formatter = DateFormat('dd-MMM-yyyy');
  var selectedDate1 = "".obs;
  var selectedDate2 = "".obs;
  late int jumlah;
  List<Booking> bookings = [];
  String? idBook;
  // "TESTNIH"

  selectDate(BuildContext context) async {
    final DateTime? picked1 = await showDatePicker(
      context: context,
      initialDate: date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked1 != null) {
      selectedDate1.value = formatter.format(picked1);
    }
  }

  getJumlahHari() {
    var datesplit1 = selectedDate1.split('-');
    var datesplit2 = selectedDate2.split('-');
    jumlah = int.parse(datesplit2[0]) - int.parse(datesplit1[0]);
  }

  selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
      context: context,
      initialDate: date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked2 != null) {
      selectedDate2.value = formatter.format(picked2);
      getJumlahHari();
    }
  }

  CollectionReference data = FirebaseFirestore.instance.collection('booking');

  addbooking(String type, String status, String harga) {
    final User? user = firebaseC.auth.currentUser;
    var nominal = int.parse(harga) * jumlah;
    idBook = Uuid().v1();

    data.doc(user!.uid).collection("book").doc(idBook).set({
      'id': idBook,
      'date': formatter.format(date),
      'nama': user.displayName,
      'checkin': selectedDate1.value,
      'checkout': selectedDate2.value,
      'hari': jumlah.toString(),
      'type': type,
      'nominal': nominal,
      'status': status,
      'bukti': "",
    });
  }

  @override
  void onInit() {
    selectedDate1.value = "Tanggal Check-In";
    selectedDate2.value = "Tanggal Check-Out";
    super.onInit();
  }
}
