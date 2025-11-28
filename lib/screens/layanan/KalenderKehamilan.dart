// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class KalenderKehamilan extends StatefulWidget {
  const KalenderKehamilan({super.key});

  @override
  State<KalenderKehamilan> createState() => _PregnancyCalendarPageState();
}

class _PregnancyCalendarPageState extends State<KalenderKehamilan> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  // Dummy tanggal penting
  final List<DateTime> importantDates = [
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2),
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 5),
  ];

  @override
  Widget build(BuildContext context) {
    // Dummy progress kehamilan
    int pregnancyWeek = 24;
    double pregnancyProgress = pregnancyWeek / 40; // 40 minggu total

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),
      appBar: AppBar(
        title: const Text(
          "Kalender Kehamilan",
          style: TextStyle(
            color: Color(0xFFFF3EA5),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFFFF3EA5)),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ======================
              //  PROGRESS KEHAMILAN
              // ======================
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Minggu ke-$pregnancyWeek",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF3EA5),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Perkembangan janin sedang pesat pada minggu ini, Mama!",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: pregnancyProgress,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFF3EA5),
                      backgroundColor: const Color(0xFFFFCFE8),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${(pregnancyProgress * 100).toStringAsFixed(1)}% perjalanan kehamilan",
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ======================
              //  KALENDER BULANAN
              // ======================
              _buildCalendar(),

              const SizedBox(height: 20),

              // ======================
              //  PERKEMBANGAN MINGGU INI
              // ======================
              Text(
                "Perkembangan Minggu Ini",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900]),
              ),
              const SizedBox(height: 10),
              _infoCard(
                "• Ukuran janin sekitar 30 cm\n"
                "• Berat sekitar 600–700 gram\n"
                "• Pendengaran semakin sensitif\n"
                "• Mama mungkin mulai merasakan kontraksi ringan (Braxton Hicks)",
              ),

              const SizedBox(height: 20),

              // ======================
              //  CHECKLIST IBU
              // ======================
              Text(
                "Checklist Mingguan",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900]),
              ),
              const SizedBox(height: 10),
              _checkboxItem("Minum vitamin prenatal"),
              _checkboxItem("USG rutin (jika jadwal minggu ini)"),
              _checkboxItem("Minum air minimal 2 liter"),
              _checkboxItem("Olahraga ringan 15–20 menit"),
            ],
          ),
        ),
      ),
    );
  }

  // =================================================
  //                  WIDGET: KALENDER
  // =================================================
  Widget _buildCalendar() {
    int daysInMonth = DateUtils.getDaysInMonth(currentDate.year, currentDate.month);
    int firstWeekday = DateTime(currentDate.year, currentDate.month, 1).weekday;

    List<Widget> rows = [];

    rows.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 18, color: Color(0xFFFF3EA5)),
            onPressed: () {
              setState(() {
                currentDate = DateTime(currentDate.year, currentDate.month - 1);
              });
            },
          ),
          Text(
            DateFormat.yMMMM().format(currentDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF3EA5),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFFFF3EA5)),
            onPressed: () {
              setState(() {
                currentDate = DateTime(currentDate.year, currentDate.month + 1);
              });
            },
          ),
        ],
      ),
    );

    rows.add(const SizedBox(height: 10));

    rows.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text("Sen"), Text("Sel"), Text("Rab"), Text("Kam"), Text("Jum"),
          Text("Sab"), Text("Min"),
        ],
      ),
    );

    rows.add(const SizedBox(height: 10));

    int dayCounter = 1 - (firstWeekday - 1);

    // Generate minggu per minggu
    for (int week = 0; week < 6; week++) {
      List<Widget> days = [];

      for (int i = 0; i < 7; i++) {
        DateTime tempDate =
            DateTime(currentDate.year, currentDate.month, dayCounter);

        bool isCurrentMonth = tempDate.month == currentDate.month;
        bool isSelected = tempDate.day == selectedDate.day &&
            tempDate.month == selectedDate.month;

        bool isImportant = importantDates.any(
          (d) => d.day == tempDate.day && d.month == tempDate.month,
        );

        days.add(
          GestureDetector(
            onTap: () {
              if (isCurrentMonth) {
                setState(() => selectedDate = tempDate);
              }
            },
            child: Container(
              width: 38,
              height: 38,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF3EA5)
                    : isImportant
                        ? const Color(0xFFFF3EA5).withOpacity(0.15)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  isCurrentMonth ? tempDate.day.toString() : "",
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : isImportant
                            ? const Color(0xFFFF3EA5)
                            : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        );

        dayCounter++;
      }

      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: days,
      ));
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: rows),
    );
  }

  // =================================================
  //              WIDGET: KARTU INFORMASI
  // =================================================
  Widget _infoCard(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
    );
  }

  // =================================================
  //              WIDGET: CHECKBOX ITEM
  // =================================================
  Widget _checkboxItem(String label) {
    return StatefulBuilder(
      builder: (context, setStateSB) {
        bool checked = false;

        return Row(
          children: [
            Checkbox(
              value: checked,
              activeColor: const Color(0xFFFF3EA5),
              onChanged: (value) {
                setStateSB(() => checked = value!);
              },
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }
}
