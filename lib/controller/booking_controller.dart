import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  DateTime date = DateTime.now();
  var formatter = DateFormat('EEEE, dd-MM-yyyy');
  var selectedDate1 = "".obs;
  var selectedDate2 = "".obs;

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
    final DateTime? picked2 = await showDatePicker(
      context: context,
      initialDate: date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked2 != null) {
      selectedDate1.value = formatter.format(picked2);
    }
  }

  @override
  void onInit() {
    selectedDate1.value = "Tanggal Check-In";
    selectedDate2.value = "Tanggal Check-Out";
    super.onInit();
  }
}
