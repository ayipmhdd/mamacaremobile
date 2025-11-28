// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:mamacaremobile/components/Logo.dart';

import 'package:mamacaremobile/widgets/CustomText.dart';
import 'package:mamacaremobile/widgets/CustomButton.dart';
import 'package:mamacaremobile/widgets/CustomInputField.dart';

import 'package:mamacaremobile/screens/auth/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  Future<void> registerUser() async {
    if (_passwordCtrl.text != _confirmCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password dan konfirmasi tidak sama")),
      );
      return;
    }

    var url = Uri.parse("https://mamacare.ayipdev.my.id/api/users"); // emulator Android
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": _usernameCtrl.text,
          "email": _emailCtrl.text,
          "phone": _phoneCtrl.text,
          "password": _passwordCtrl.text,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registrasi berhasil: ${data['message'] ?? ''}")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal daftar: ${response.body}")),
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
        leading: const BackButton(color: Color(0xFFFF3EA5)),
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
                  "Daftar Akun Mama",
                  type: TextType.h3,
                  height: 1.5, 
                ),
                const SizedBox(height: 24),

                // Username
                CustomInputField(
                  controller: _usernameCtrl,
                  hintText: "Username",
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),

                // Email
                CustomInputField(
                  controller: _emailCtrl,
                  hintText: "Email address",
                  icon: Icons.email,
                ),
                const SizedBox(height: 16),

                // Phone
                CustomInputField(
                  controller: _phoneCtrl,
                  hintText: "Phone",
                  icon: Icons.phone,
                ),
                const SizedBox(height: 16),

                // Password
                CustomInputField(
                  controller: _passwordCtrl,
                  hintText: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                // Confirm Password
                CustomInputField(
                  controller: _confirmCtrl,
                  hintText: "Confirm password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 24),

                // Tombol Daftar
                CustomButton(
                  title: "Daftar",
                  width: double.infinity,
                  height: 48,
                  backgroundColor: const Color(0xFFFF3EA5),
                  textColor: Colors.white,
                  borderRadius: 24,
                  onPressed: registerUser,
                ),
                const SizedBox(height: 16),

                // Sudah punya akun
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        "Masuk",
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