// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../models/ScheduleModel.dart';

class ScheduleStackCard extends StatelessWidget {
  const ScheduleStackCard({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulesToRender = dummySchedules.reversed.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Stack(
        alignment: Alignment.topCenter,
        children: List.generate(schedulesToRender.length, (index) {
          final schedule = schedulesToRender[index];

          double yOffset = (schedulesToRender.length - 1 - index) * 6.0;
          double scale = 1.0 - ((schedulesToRender.length - 1 - index) * 0.05);
          double opacity = 1.0 - ((schedulesToRender.length - 1 - index) * 0.1);

          return Transform.translate(
            offset: Offset(0, yOffset),
            child: Transform.scale(
              scale: scale.clamp(0.85, 1.0),
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: opacity,
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
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18), // 🔥 tambahin biar gap bawah muncul
      decoration: BoxDecoration(
        color: const Color(0xFFFF3EA5), // bg pink
      ),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.black, // bg hitam
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFFAFAFA),
                  radius: 25,
                  child: Icon(Icons.person, color: Color(0xFFFF3EA5)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text(schedule.title,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF72B3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.mail, color: Colors.white, size: 22),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(color: Colors.white, thickness: 1),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tanggal",
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Text(schedule.date,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Waktu",
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Text(schedule.time,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ],
            ),

            if (isFrontCard) ...[
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text("Re-schedule",
                          style: TextStyle(
                              color: Color(0xFFFF3EA5),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF72B3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text("Lihat profil",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
