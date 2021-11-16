// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TransaksiBooking extends StatefulWidget {
  TransaksiBooking({Key? key}) : super(key: key);

  @override
  _TransaksiBookingState createState() => _TransaksiBookingState();
}

class _TransaksiBookingState extends State<TransaksiBooking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Transaksi Booking',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Text('Belum Bayar'),
              Text('Sudah Bayar'),
              Text('Dibatalkan'),
            ],
          ),
        ),
      ),
    );
  }
}
