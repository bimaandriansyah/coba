import 'package:coba/controller/navigator_controller.dart';
import 'package:coba/model/booking_model.dart';
import 'package:coba/screens/booking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReservationPage extends StatelessWidget {
  final NavigatorController navC = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Transaksi Booking',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            isScrollable: false,
            // ignore: prefer_const_constructors
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            tabs: [
              Text('Belum Bayar',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  )),
              Text('Sudah Dibayar', style: GoogleFonts.poppins(fontSize: 13)),
              Text('Dibatalkan', style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            navC.bookingBelum.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Tidak ada data transaksi',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          )),
                    ),
                  )
                : Scrollbar(
                    child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: navC.bookingBelum.length,
                    itemBuilder: (context, index) {
                      final _data = navC.bookingBelum.elementAt(index);
                      return typeRoomCard(_data);
                    },
                  )),
            navC.bookingSudah.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Tidak ada data transaksi',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          )),
                    ),
                  )
                : Scrollbar(
                    child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: navC.bookingSudah.length,
                    itemBuilder: (context, index) {
                      final _data = navC.bookingSudah.elementAt(index);
                      return typeRoomCard(_data);
                    },
                  )),
            navC.bookingBatal.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Tidak ada data transaksi',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          )),
                    ),
                  )
                : Scrollbar(
                    child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: navC.bookingBatal.length,
                    itemBuilder: (context, index) {
                      final _data = navC.bookingBatal.elementAt(index);
                      return typeRoomCard(_data);
                    },
                  )),
          ],
        ),
      ),
    );
  }

  Widget typeRoomCard(Booking data) {
    var harga = data.type == "Type A" ? "350000" : "225000";
    return GestureDetector(
      onTap: () {
        Get.to(() => BookingPage(), arguments: [
          data.hari,
          harga,
          data.id,
          data.status,
          data.bukti,
          data.checkin,
          data.checkout
        ]);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        data.type == "Type A"
                            ? 'assets/room1.jpg'
                            : 'assets/room2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.type.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${data.checkin}  s/d  ${data.checkout}",
                          style: GoogleFonts.poppins(fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "x${data.hari}",
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Total Pembayaran",
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: "IDR ")
                        .format(data.nominal),
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Divider(),
              data.status == "belum bayar"
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Menunggu Pembayaran",
                            style: GoogleFonts.poppins(fontSize: 10),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => BookingPage(), arguments: [
                              data.hari,
                              harga,
                              data.id,
                              data.status,
                              data.bukti,
                              data.checkin,
                              data.checkout
                            ]);
                          },
                          child: Text(
                            "BAYAR",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Colors.orange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20)),
                        ),
                      ],
                    )
                  : Center(
                      heightFactor: 2,
                      child: Text(
                        data.status == "sudah"
                            ? "Sudah melakukan pembayaran"
                            : "Anda melakukan pembatalan booking",
                        style: GoogleFonts.poppins(fontSize: 10),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
