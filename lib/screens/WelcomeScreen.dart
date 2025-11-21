import 'package:flutter/material.dart';
import 'package:mamacaremobile/screens/LoginScreen.dart';
import 'package:mamacaremobile/widgets/CustomButton.dart';
import 'package:mamacaremobile/widgets/CustomText.dart';
import 'RegisterScreen.dart';

// Entry point
void main() {
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar ilustrasi
            Expanded(
              flex: 3,
              child: Image.asset(
                "assets/welcome.png",
                width: 250,
              ),
            ),

            // Teks sambutan
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomText(
                    "Selamat Datang \ndi MamaCare",
                    type: TextType.h1,
                    textAlign: TextAlign.center,
                    height: 1.1, 
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                    child: CustomText(
                      "Halo Mama! MamaCare hadir untuk menemani perjalanan kehamilanmu agar lebih sehat, aman, dan penuh kebahagiaan.",
                      type: TextType.p,
                      textAlign: TextAlign.center,
                      height: 1,
                      color: Color(0xFF1e1e1e),
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Masuk & Daftar
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      title: "Masuk",
                      width: 250,
                      height: 48,
                      backgroundColor: const Color(0xFFFF3EA5),
                      textColor: Colors.white,
                      borderRadius: 24,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: 8),

                    CustomButton(
                      title: "Daftar",
                      width: 250,
                      height: 48,
                      outlined: true,
                      borderColor: const Color(0xFFFF3EA5),
                      textColor: const Color(0xFFFF3EA5),
                      borderRadius: 24,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterScreen()),
                        );
                      },
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}