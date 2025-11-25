// lib/screens/kata_sandi_screen.dart
import 'package:flutter/material.dart';

class KataSandiScreen extends StatefulWidget {
  const KataSandiScreen({super.key});

  @override
  State<KataSandiScreen> createState() => _KataSandiScreenState();
}

class _KataSandiScreenState extends State<KataSandiScreen> {
  bool oldObscure = true;
  bool newObscure = true;
  bool confirmObscure = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Ubah Kata Sandi"),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Keamanan Akun",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Silakan masukkan kata sandi lama Anda dan buat kata sandi baru yang lebih aman.",
                style: TextStyle(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 25),

              // =============================
              // PASSWORD LAMA
              // =============================
              TextFormField(
                obscureText: oldObscure,
                decoration: InputDecoration(
                  labelText: "Kata Sandi Lama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      oldObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => oldObscure = !oldObscure);
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan kata sandi lama";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // =============================
              // PASSWORD BARU
              // =============================
              TextFormField(
                obscureText: newObscure,
                decoration: InputDecoration(
                  labelText: "Kata Sandi Baru",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      newObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => newObscure = !newObscure);
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan kata sandi baru";
                  }
                  if (value.length < 6) {
                    return "Minimal 6 karakter";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // =============================
              // KONFIRMASI PASSWORD BARU
              // =============================
              TextFormField(
                obscureText: confirmObscure,
                decoration: InputDecoration(
                  labelText: "Konfirmasi Kata Sandi Baru",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      confirmObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => confirmObscure = !confirmObscure);
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Konfirmasi kata sandi baru";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 35),

              // =============================
              // TOMBOL SIMPAN
              // =============================
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // handle update password
                    }
                  },
                  child: const Text(
                    "Simpan Perubahan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
