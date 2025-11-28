// ignore_for_file: file_names
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifikasi MamaCare",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(text: "Umum"),
            Tab(text: "Riwayat Check-Up"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGeneralNotifications(),
          _buildCheckupHistory(),
        ],
      ),
    );
  }

  // ---------- NOTIFIKASI UMUM ----------
  Widget _buildGeneralNotifications() {
    List<Map<String, String>> data = [
      {
        "title": "Tips Nutrisi Hari Ini",
        "desc": "Perbanyak konsumsi makanan tinggi asam folat untuk mendukung perkembangan janin.",
        "time": "2 jam lalu"
      },
      {
        "title": "Pengingat Minum Air",
        "desc": "Jangan lupa minum 1 gelas air agar tubuh tetap terhidrasi.",
        "time": "4 jam lalu"
      },
      {
        "title": "Edukasi Kehamilan",
        "desc": "Kenali tanda-tanda trimester kedua dan cara menjaga kenyamanan tubuh.",
        "time": "Kemarin"
      },
    ];

    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return _notificationCard(
          title: data[index]["title"]!,
          desc: data[index]["desc"]!,
          time: data[index]["time"]!,
          icon: Icons.notifications_active_rounded,
        );
      },
    );
  }

  // ---------- NOTIFIKASI RIWAYAT CHECK-UP ----------
  Widget _buildCheckupHistory() {
    List<Map<String, String>> data = [
      {
        "title": "Hasil Check-Up Mingguan",
        "desc": "Tekanan darah normal · Detak jantung janin stabil",
        "time": "3 hari lalu"
      },
      {
        "title": "Pemeriksaan Trimester Kedua",
        "desc": "Kondisi janin sehat dan berkembang baik.",
        "time": "1 minggu lalu"
      },
      {
        "title": "USG Bulanan",
        "desc": "Gerakan janin aktif · Posisi kepala baik.",
        "time": "3 minggu lalu"
      },
    ];

    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return _notificationCard(
          title: data[index]["title"]!,
          desc: data[index]["desc"]!,
          time: data[index]["time"]!,
          icon: Icons.favorite_rounded,
        );
      },
    );
  }

  // ---------- TEMPLATE CARD NOTIFIKASI ----------
  Widget _notificationCard({
    required String title,
    required String desc,
    required String time,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.orange, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.2)),
                const SizedBox(height: 4),
                Text(desc,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    )),
                const SizedBox(height: 6),
                Text(time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}