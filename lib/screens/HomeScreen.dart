// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/ScheduleStackCard.dart'; 
import '../widgets/ServiceBox.dart';
import '../models/ServiceModel.dart';
import '../widgets/ArticleSection.dart';
import '../widgets/DoctorListItem.dart';
import '../widgets/DoctorFilterButton.dart';
import '../widgets/SearchBarHome.dart';
import './DoctorScreen.dart';
import './ArtikelScreen.dart';
import './NotifikasiScreen.dart';
import './PanduanNutrisi.dart';
import './PanduanAktivitas.dart';
import './KalenderKehamilan.dart';
import './ComunityScreen.dart';
import './CareBot.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String? photoUrl;

  const HomeScreen({
    super.key,
    required this.username,
    this.photoUrl,
  });

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // State untuk melacak halaman saat ini (0 = Home)
  // int _selectedIndex = 0; 
  
  final List<Map<String, dynamic>> _doctorFilters = [
    {"label": "Semua", "isSelected": true},
    {"label": "Spesialis Kandungan", "isSelected": false},
    {"label": "Bidan", "isSelected": false},
  ];

  // void _onItemTapped(int index) {
    // setState(() {
      // _selectedIndex = index;
    // });
  // }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 11) {
      return "Selamat pagi";
    } else if (hour >= 11 && hour < 15) {
      return "Selamat siang";
    } else if (hour >= 15 && hour < 18) {
      return "Selamat sore";
    } else {
      return "Selamat malam";
    }
  }

  String getInitials(String name) {
    final names = name.split(' ');
    String initials = '';
    for (var part in names) {
      if (part.isNotEmpty) initials += part[0];
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final String currentUsername = widget.username;
    final String? currentPhotoUrl = widget.photoUrl;

    void _navigateToService(BuildContext context, String label) {
      switch (label) {
        case "Panduan Nutrisi":
          Navigator.push(context, MaterialPageRoute(builder: (_) => const PanduanNutrisi()));
          break;

        case "Panduan Aktivitas":
          Navigator.push(context, MaterialPageRoute(builder: (_) => const PanduanAktivitas()));
          break;

        case "Kalender Kehamilan":
          Navigator.push(context, MaterialPageRoute(builder: (_) => const KalenderKehamilan()));
          break;

        case "Komunitas":
          Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunityScreen()));
          break;

        case "CareBot":
          Navigator.push(context, MaterialPageRoute(builder: (_) => const CareBot()));
          break;

        default:
          break;
      }
    }


    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar( 
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFFF3EA5),
              backgroundImage: currentPhotoUrl != null ? NetworkImage(currentPhotoUrl) : null,
              child: currentPhotoUrl == null
                  ? Text(
                      getInitials(currentUsername),
                      style: const TextStyle(color: Color(0xFFFAFAFA), fontWeight: FontWeight.bold),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${getGreeting()}!\n",
                    style: const TextStyle(
                      color: Color(0xFF787A7E),
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: currentUsername,
                    style: const TextStyle(
                      color: Color(0xFF191F24),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
            padding: EdgeInsets.zero, // biar tidak ada padding default besar
            constraints: const BoxConstraints(), // hilangkan batas default IconButton
            icon: Image.asset(
              "assets/icons/notification-icon.png",
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      
      // Konten Layar (Body)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              const SearchBarHome(),
              const SizedBox(height: 10),

              // JADWAL DENGAN DOKTER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Jadwal dengan Dokter",
                    style: TextStyle(
                      color: Color(0xFF191F24),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Semua",
                      style: TextStyle(color: Color(0xFF787A7E)),
                    ),
                  ),
                ],
              ),
              const ScheduleStackCard(), // Card jadwal tumpukan
              const SizedBox(height: 12),

              // LAYANAN (Wrap: 4 Kolom)
              const Text(
                "Layanan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF191F24)
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: dummyServiceLabels.map((label) {
                  return ServiceBox(
                    label: label,
                    onTap: () {
                      _navigateToService(context, label);
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // DOKTER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dokter",
                    style: TextStyle(
                      color: Color(0xFF191F24),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DoctorScreen()),
                      );
                    },
                    child: const Text(
                      "Semua",
                      style: TextStyle(color: Color(0xFF787A7E)),
                    ),
                  ),
                ],
              ),
              
              // Filter Dokter (ListView Horizontal Scroll)
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: _doctorFilters.length,
                  itemBuilder: (context, index) {
                    final filter = _doctorFilters[index];
                    
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: DoctorFilterButton(
                        label: filter["label"] as String,
                        isSelected: filter["isSelected"] as bool,
                        onPressed: () {
                          // Logika filter (diabaikan di sini)
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Daftar Dokter (List)
              Column(
                children: List.generate(4, (index) {
                  return const DoctorListItem();
                }),
              ),
              const SizedBox(height: 20),

              // ARTIKEL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Artikel",
                    style: TextStyle(
                      color: Color(0xFF191F24),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ArticleScreen()),
                      );
                    },
                    child: const Text(
                      "Semua",
                      style: TextStyle(color: Color(0xFF787A7E)),
                    ),
                  ),
                ],
              ),
              const ArticleSection(),
            ],
          ),
        ),
      ),
    );
  }
}


