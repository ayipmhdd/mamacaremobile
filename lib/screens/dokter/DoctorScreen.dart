// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mamacaremobile/screens/dokter/BookingDokter.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int selectedDoctorIndex = -1;

  final List<Map<String, dynamic>> doctors = [
    {"name": "Dr. Nur Fulan, Sp.OG", "specialist": "Bidan", "rating": 4.9},
    {"name": "Dr. Siti Fulanah, Sp. OG", "specialist": "Spesialis Kandungan", "rating": 4.9},
    {"name": "Dr. Nurahim, Sp. OG", "specialist": "Bidan", "rating": 4.7},
    {"name": "Dr. Siti Sumbul, Sp. OG", "specialist": "Spesialis Kandungan", "rating": 4.6},
    {"name": "Dr. Jamileah, Sp. OG", "specialist": "Dokter Anak", "rating": 4.6},
    {"name": "Dr. Sarwijem, Sp. OG", "specialist": "Spesialis Kandungan", "rating": 4.5},
    {"name": "Dr. Suminten, Sp. OG", "specialist": "Spesialis Kandungan", "rating": 4.5},
    {"name": "Dr. Durokim, Sp. OG", "specialist": "Bidan", "rating": 4.5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFF0099),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Dokter",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar + filter
            Row(
              children: [
                // ✅ Search bar dengan tinggi fix
                Expanded(
                  child: SizedBox(
                    height: 50, // samakan dengan tombol filter
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari dokter...",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: const Color(0xFFF5F6FA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // ✅ Tombol filter dengan tinggi fix
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 20),

            const Text(
              "Semua",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Grid dokter
            Expanded(
              child: GridView.builder(
                itemCount: doctors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  final bool isSelected = selectedDoctorIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDoctorIndex = index;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingPage(doctor: doctor),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFF3EA5) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? const Color(0xFFFF3EA5) : const Color(0xFFEFEFEF),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: const AssetImage("assets/potoprofil.png"),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white24 : const Color(0xFFFFF7E0),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.yellow, size: 14),
                                    const SizedBox(width: 4),
                                    Text(
                                      doctor["rating"].toString(),
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              doctor["name"],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              doctor["specialist"],
                              style: TextStyle(
                                fontSize: 10,
                                color: isSelected ? Colors.white70 : Colors.grey,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white : const Color(0xFFFF3EA5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Booking",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? const Color(0xFFFF3EA5) : Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.email,
                                  color: isSelected ? Colors.white : const Color(0xFFFF3EA5),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
