// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mamacaremobile/components/Icon.dart';
import 'package:mamacaremobile/widgets/CustomButton.dart';
import 'package:mamacaremobile/models/ScheduleModel.dart';

class ScheduleStackCard extends StatelessWidget {
  const ScheduleStackCard({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulesToRender = dummySchedules.reversed.toList();

    return Stack(
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
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFF3EA5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFFF3EA5),
                  radius: 25,
                  child: Icon(Icons.person, color: Color(0xFFFAFAFA)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule.name,
                          style: const TextStyle(
                              color: Color(0xFFFF3EA5),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text(schedule.title,
                          style: const TextStyle(
                              color: Color(0xB3FF3EA5), fontSize: 14)),
                    ],
                  ),
                ),
                IconMail(),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Color(0xFFFF3EA5), thickness: 1),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tanggal",
                        style: TextStyle(color: Color(0xB3FF3EA5), fontSize: 12)),
                    Text(schedule.date,
                        style: const TextStyle(
                            color: Color(0xFFFF3EA5),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Waktu",
                        style: TextStyle(color: Color(0xB3FF3EA5), fontSize: 12)),
                    Text(schedule.time,
                        style: const TextStyle(
                            color: Color(0xFFFF3EA5),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (isFrontCard) ...[
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: "Reschedule",
                      width: double.infinity,
                      height: 40,
                      backgroundColor: const Color(0xFFFF3EA5),
                      textColor: Colors.white,
                      borderRadius: 24,
                      fontSize: 14,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      title: "Lihat profil",
                      width: double.infinity,
                      height: 39,
                      fontSize: 14,
                      outlined: true,
                      borderColor: const Color(0xFFFF3EA5),
                      textColor: const Color(0xFFFF3EA5),
                      borderRadius: 24,
                      onPressed: () {},
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
