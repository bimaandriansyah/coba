// ignore_for_file: prefer_const_constructors

import 'package:coba/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

List bank = [
  "BANK BRI",
  "BANK BCA",
  "BANK BNI",
  "BANK MANDIRI",
  "INDOMARET",
  "ALFAMART"
];

List no = [nbri, nbca, nbni, nmandiri];
String nbri = "1111-11-111111-11-1";
String nbca = "1111-1111-11";
String nbni = "111-111-1111";
String nmandiri = "111-11-1111111-1";

List detail = [bri, bca, bni, mandiri];
const String bri = "- Masukkan kartu ATM ke solt mesin ATM.\n"
    "- Masukkan nomor PIN.\n"
    "- Pilih jenis transaksi transfer.\n"
    "- Pilih tujuan transfer.\n"
    "- Masukkan jumlah transfer.\n"
    "- Transaksi berhasil diproses.\n"
    "- Upload bukti transfer.\n"
    "- Menunggu konfirmasi.\n";

const String bca = "- Masukkan kartu ATM ke solt mesin ATM.\n"
    "- Masukkan nomor PIN.\n"
    "- Pilih jenis transaksi transfer.\n"
    "- Pilih tujuan transfer.\n"
    "- Masukkan jumlah transfer.\n"
    "- Transaksi berhasil diproses.\n"
    "- Upload bukti transfer.\n"
    "- Menunggu konfirmasi.\n";

const String bni = "- Masukkan kartu ATM ke solt mesin ATM.\n"
    "- Masukkan nomor PIN.\n"
    "- Pilih jenis transaksi transfer.\n"
    "- Pilih tujuan transfer.\n"
    "- Masukkan jumlah transfer.\n"
    "- Transaksi berhasil diproses.\n"
    "- Upload bukti transfer.\n"
    "- Menunggu konfirmasi.\n";

const String mandiri = "- Masukkan kartu ATM ke solt mesin ATM.\n"
    "- Masukkan nomor PIN.\n"
    "- Pilih jenis transaksi transfer.\n"
    "- Pilih tujuan transfer.\n"
    "- Masukkan jumlah transfer.\n"
    "- Transaksi berhasil diproses.\n"
    "- Upload bukti transfer.\n"
    "- Menunggu konfirmasi.\n";

class _TransferPageState extends State<TransferPage> {
  List data = [
    {
      'title': 'BANK BRI',
      'desc': nbri,
      'isi': bri,
    },
    {
      'title': 'BANK BCA',
      'desc': nbca,
      'isi': bca,
    },
    {
      'title': 'BANK BNI',
      'desc': nbni,
      'isi': bni,
    },
    {
      'title': 'BANK MANDIRI',
      'desc': nmandiri,
      'isi': mandiri,
    },
  ];
  String selectedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Pembayaran"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: SizedBox(
                height: Get.height * 0.8,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return _expansionCard(index, bank, detail, no);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _expansionCard(int index, List bank, List detail, List no) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      color: AppColors.lightGrey,
      child: RoundedExpansionTile(
        trailing: Icon(Icons.keyboard_arrow_down),
        duration: Duration(milliseconds: 200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Container(
            child: Text(
          bank[index].toString(),
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        )),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            tileColor: AppColors.backgroundColor,
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                (no[index].toString()),
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            subtitle: Text(
              detail[index].toString(),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
