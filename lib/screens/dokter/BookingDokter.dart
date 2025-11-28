// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  final Map<String, dynamic> doctor;

  const BookingPage({super.key, required this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selectedDateIndex = 0;
  int? selectedTimeIndex;

  // Slot jam
  final List<String> timeSlots = [
    "07:00 WIB", "07:30 WIB",
    "08:00 WIB", "08:30 WIB",
    "09:00 WIB", "09:30 WIB",
    "10:00 WIB", "10:30 WIB",
    "11:00 WIB", "11:30 WIB",
    "12:30 WIB", "13:00 WIB", 
    "13:30 WIB", "14:00 WIB",
    "14:30 WIB", "15:00 WIB",
    "15:30 WIB", "16:00 WIB",
    "16:30 WIB", "17:00 WIB",
  ];

  // Contoh jam yang sudah dibooking orang lain
  final List<String> bookedSlots = [
    "09:00 WIB",
    "11:00 WIB",
    "13:30 WIB",
    "16:30 WIB",
  ];

  // Buat daftar 7 tanggal ke depan
  List<DateTime> generateDates() {
    return List.generate(7, (i) => DateTime.now().add(Duration(days: i)));
  }

  String dayName(DateTime date) {
    const days = ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];
    return days[date.weekday % 7];
  }

  String monthName(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return months[date.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;
    final dates = generateDates();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Color(0xFFFF0099),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "${doctor['name']}",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ✅ KARTU PROFIL DOKTER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFF3EA5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctor["name"],
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.doctor["specialist"],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 18),
                              Text(
                                "Rating ${widget.doctor["rating"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Foto Dokter
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/potoprofil.png"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Pilih tanggal dan waktu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
              ),
            ),

            const SizedBox(height: 20),

            // ✅ PILIH TANGGAL
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final isSelected = selectedDateIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                        selectedTimeIndex = null;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFFF3EA5)
                              : const Color(0xFFE4E4E4),
                        ),
                        color: isSelected
                            ? const Color(0xFFFF3EA5)
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            dayName(date),
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            monthName(date),
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),
            const Text(
              "Ketersediaan",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),

            // ✅ GRID TIME SLOTS
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: timeSlots.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 2.3,
              ),
              itemBuilder: (context, index) {
                final time = timeSlots[index];
                final isUnavailable = bookedSlots.contains(time);
                final isSelected = selectedTimeIndex == index;

                Color bgColor;
                Color textColor;

                if (isUnavailable) {
                  bgColor = const Color(0xFFE5E5E5); // abu-abu
                  textColor = Colors.grey;
                } else if (isSelected) {
                  bgColor = const Color(0xFFFF3EA5); // pink banget
                  textColor = Colors.white;
                } else {
                  bgColor = const Color(0xFFFBE7F2); // pink pias
                  textColor = Colors.black;
                }

                return GestureDetector(
                  onTap: isUnavailable
                      ? null
                      : () {
                          setState(() {
                            selectedTimeIndex = index;
                          });
                        },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            // ✅ BUTTON BUAT JADWAL
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedTimeIndex == null
                    ? null
                    : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3EA5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Buat Jadwal",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
