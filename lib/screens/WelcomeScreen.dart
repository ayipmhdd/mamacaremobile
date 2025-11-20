// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mamacaremobile/screens/LoginScreen.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';
// import 'HomeScreen.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar ilustrasi
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Image.asset(
                  "assets/welcome.png", // ganti dengan gambar kamu
                  width: 250,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Teks sambutan
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Selamat Datang\n di MamaCare",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFFF3EA5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Halo Mama! MamaCare hadir untuk menemani perjalanan kehamilanmu agar lebih sehat, aman, dan penuh kebahagiaan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF75BF),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Masuk & Daftar
            Expanded(
              flex: 2,
              child: Column(
                children: [ 
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    // Tombol Masuk
                    child: SizedBox(
                      width: 250,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF3EA5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                    
                  const SizedBox(height: 12),

                    // Tombol Daftar
                  SizedBox(
                    width: 250,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFF3EA5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF3EA5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
