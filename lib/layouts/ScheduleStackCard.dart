// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/ScheduleModel.dart';

class ScheduleStackCard extends StatelessWidget {
  const ScheduleStackCard({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulesToRender = dummySchedules.reversed.toList();

    return SizedBox(
      height: 230, 
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: List.generate(schedulesToRender.length, (index) {
          final schedule = schedulesToRender[index];
          // Index 0 = Paling Belakang, Index 2 = Paling Depan,

          double yOffset = (schedulesToRender.length - 1 - index) * 6.0; 
          double scale = 1.0 - ((schedulesToRender.length - 1 - index) * 0.05);
          double opacity = 1.0 - ((schedulesToRender.length - 1 - index) * 0.1); 

          return Positioned(
            top: yOffset,
            left: 0,
            right: 0, 
            child: Transform.scale(
              scale: scale.clamp(0.8, 1.0),
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: opacity.clamp(0.5, 1.0),
                child: AppointmentCard(
                  schedule: schedule,
                  isFrontCard: index == schedulesToRender.length - 1, 
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


class AppointmentCard extends StatelessWidget {
  final Schedule schedule;
  final bool isFrontCard;

  const AppointmentCard({
    super.key,
    required this.schedule,
    required this.isFrontCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(schedule.bgColorHex),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // PENTING: Mencegah Overflow!
        children: [
          // 1. Baris Informasi Dokter
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(Icons.person, color: Color(0xFFFF3EA5)), 
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      schedule.title, // 'Bidan'
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8), // Padding untuk jarak ikon dari tepi lingkaran
                decoration: BoxDecoration(
                  color: const Color(0xFFFF72B3), // Warna background pink muda (atau pink yang Anda inginkan)
                  shape: BoxShape.circle, // Membuat bentuk lingkaran
                ),
                child: const Icon(
                  Icons.mail, 
                  color: Colors.white, // Warna ikon putih
                  size: 25, // Sesuaikan ukuran ikon jika diperlukan
                ),
              ),
            ],
          ),

          // 2. Garis Pemisah Putih
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(
              color: Colors.white,
              thickness: 1,
              height: 1,
            ),
          ),

          // 3. Baris Detail Tanggal dan Waktu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tanggal",
                    style: TextStyle(
                      color: Colors.white70, fontSize: 12
                    )
                  ),
                  Text(
                    schedule.date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    )
                  ),
                ],
              ),
              // Kolom Waktu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Waktu",
                    style: TextStyle(
                      color: Colors.white70, fontSize: 12
                    )
                  ),
                  Text(
                    schedule.time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    )
                  ),
                ],
              ),
            ],
          ),

          // 4. Baris Tombol (Hanya untuk kartu depan)
          if (isFrontCard) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Border Radius 20 agar lebih oval
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Re-schedule",
                      style: TextStyle(
                        color: Color(0xFFFF3EA5),
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF72B3), // Pink muda/cerah
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Lihat profil",
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}