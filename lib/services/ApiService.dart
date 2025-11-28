// ignore_for_file: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api"; // untuk emulator Android

  // GET: Ambil data user
  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal ambil data, code: ${response.statusCode}");
    }
  }

  // POST: Simpan user baru
  Future<bool> createUser(String username, String email, String phone, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      }),
    );

    if (response.statusCode == 201) {
      return true; // berhasil
    } else {
      log("Response: ${response.statusCode} ${response.body}");
      return false;
    }
  }
}
