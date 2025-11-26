// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mamacaremobile/layouts/CustomAppBar.dart';
import 'package:mamacaremobile/routes/Route.dart';
import 'package:mamacaremobile/widgets/CustomButton.dart';
import 'package:mamacaremobile/widgets/CustomText.dart';
import '../../layouts/ScheduleStackCard.dart'; 
import '../../widgets/ServiceBox.dart';
import '../../models/ServiceModel.dart';
import '../../layouts/ArticleSection.dart';
import '../../layouts/DoctorListItem.dart';
import '../layanan/PanduanNutrisi.dart';
import '../layanan/PanduanAktivitas.dart';
import '../layanan/KalenderKehamilan.dart';
import '../komunitas/ComunityScreen.dart';
import '../layanan/CareBot.dart';

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
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 11) return "Selamat pagi";
    if (hour >= 11 && hour < 15) return "Selamat siang";
    if (hour >= 15 && hour < 18) return "Selamat sore";
    return "Selamat malam";
  }

  void navigateToService(BuildContext context, String label) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: CustomAppBar.home(
        username: widget.username,
        photoUrl: widget.photoUrl,
        greeting: getGreeting(),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScheduleStackCard(),

              /// Konten utama dengan padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// LAYANAN
                    const CustomText(
                      "Layanan",
                      type: TextType.h5,
                      color: Color(0xFF191F24),
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
                          onTap: () => navigateToService(context, label),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    /// DOKTER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          "Dokter",
                          type: TextType.h5,
                          color: Color(0xFF191F24),
                        ),
                        CustomTextButton(
                          title: "Semua",
                          textColor: const Color(0xFF787A7E),
                          onPressed: () => AppRoute.toDoctor(context),
                        ),
                      ],
                    ),
                    Column(children: List.generate(4, (index) => const DoctorListItem()),),

                    const SizedBox(height: 20),

                    /// ARTIKEL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          "Artikel",
                          type: TextType.h5,
                          color: Color(0xFF191F24),
                        ),
                        CustomTextButton(
                          title: "Semua",
                          textColor: const Color(0xFF787A7E),
                          onPressed: () => AppRoute.toArticle(context),
                        ),
                      ],
                    ),
                    const ArticleSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}