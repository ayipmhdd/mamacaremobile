import 'package:flutter/material.dart';

class CareBot extends StatefulWidget {
  const CareBot({super.key});

  @override
  State<CareBot> createState() => _CareBotPageState();
}

class _CareBotPageState extends State<CareBot> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [
    {
      "fromBot": true,
      "text":
          "Halo Mama! 👋 Aku CareBot. Ada yang ingin Mama tanyakan tentang kehamilan hari ini?"
    }
  ];

  void sendMessage() {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        "fromBot": false,
        "text": text,
      });
    });

    _controller.clear();

    // Simulasi jawaban bot
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        messages.add({
          "fromBot": true,
          "text":
              "Terima kasih Mama! Untuk saat ini, sistem AI belum aktif ya. Tapi halaman chatbot sudah siap digunakan 🚀"
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "CareBot",
          style: TextStyle(
            color: Color(0xFFFF3EA5),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFF3EA5)),
      ),

      // --- BODY ---
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool fromBot = messages[index]["fromBot"];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Align(
                    alignment:
                        fromBot ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 260),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: fromBot
                            ? Colors.white
                            : const Color(0xFFFF3EA5).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        messages[index]["text"],
                        style: TextStyle(
                          fontSize: 14,
                          color: fromBot
                              ? Colors.black87
                              : const Color(0xFFFF3EA5),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // --- INPUT FIELD ---
          Container(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFFF3EA5),
                        width: 1.2,
                      ),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ketik pesan...",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF3EA5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
