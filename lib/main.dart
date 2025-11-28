import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mamacaremobile/services/ApiService.dart';

import 'package:mamacaremobile/screens/welcome/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Ganti warna status bar global
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFFFFFFF), // background putih
    statusBarIconBrightness: Brightness.dark, // ikon hitam biar kontras
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MamaCare',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFFF3EA5)), // default teks
        ),
      ),
      home: const SplashScreen(), // pertama kali buka, tampil splash
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key}); // perbaikan disini

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ApiService api = ApiService();
  List users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      final data = await api.getUsers();
      setState(() {
        users = data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List")),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                );
              },
            ),
    );
  }
}
