// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mamacaremobile/components/Logo.dart';
import 'package:mamacaremobile/widgets/CustomButton.dart';
import 'package:mamacaremobile/widgets/CustomText.dart';
import 'package:mamacaremobile/widgets/CustomInputField.dart';
import 'dart:convert';
import '../MainScreen.dart';

import 'ForgotPasswordScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  Future<void> loginUser() async {
    var url = Uri.parse("https://mamacare.ayipdev.my.id/api/users/login"); // ganti sesuai endpoint Laravel kamu
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": _emailCtrl.text,
          "password": _passwordCtrl.text,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // ignore: avoid_print
        print("DEBUG LOGIN RESPONSE: $data");

        // cek struktur JSON kamu di response.body
        // final usernameFromAPI = data['user']?['name'] ?? 'Mama';
        // final photoUrlFromAPI = data['user']?['photo'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login berhasil: ${data['message'] ?? ''}")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              // username: usernameFromAPI,
              // photoUrl: photoUrlFromAPI,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login gagal: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Color(0xFFFF3EA5),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Logo & Judul
                const Logo(),
                const SizedBox(height: 24),

                CustomText(
                  "Masuk Akun Mama",
                  type: TextType.h3,
                  height: 1.5, 
                ),
                CustomText(
                  "Masukkan email dan password akun Mama!",
                  type: TextType.p,
                  color: Color(0xFF1e1e1e),
                ),

                const SizedBox(height: 24),

                // Form Email
                CustomInputField(
                  controller: _emailCtrl,
                  hintText: "Email address",
                  icon: Icons.email,
                ),

                const SizedBox(height: 16),

                // Form Password
                CustomInputField(
                  controller: _passwordCtrl,
                  hintText: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),

                // Lupa password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      "Lupa password?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Tombol Masuk
                CustomButton(
                  title: "Masuk",
                  width: double.infinity,
                  height: 48,
                  backgroundColor: const Color(0xFFFF3EA5),
                  textColor: Colors.white,
                  borderRadius: 24,
                  onPressed: loginUser,
                ),

                const SizedBox(height: 16),

                // Atau
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFFF75BF))),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Color(0xFF757575)),
                      ),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFFF75BF))),
                  ],
                ),
                const SizedBox(height: 16),

                // Tombol Google
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFF3EA5)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    icon: Image.asset("assets/google.png", width: 30),
                    label: const Text(
                      "Lanjutkan dengan Google",
                      style: TextStyle(color: Color(0XFF000000), fontSize: 16,),
                    ),
                    onPressed: () {
                      // aksi login dengan Google
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Daftar jika belum punya akun
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun? ",
                      style: TextStyle(color: Color(0xFF000000)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}