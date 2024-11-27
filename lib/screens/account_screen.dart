import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:umeet/login_screen.dart';
import 'package:umeet/sign_up.dart';
import 'akunsaya_screen.dart';
import 'package:umeet/splash_page.dart';
import 'package:umeet/screens/account_screen.dart';
import 'package:umeet/chat.dart';
import 'package:umeet/eventpage.dart';
import 'package:umeet/main.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _currentIndex = 4;

  Widget buildMenuItem({
    required String title,
    required String assetImage,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Image.asset(assetImage, width: 35, height: 35),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Ionicons.arrow_forward, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, const Color.fromARGB(255, 26, 100, 160)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Ionicons.chevron_back_outline, size: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Image.asset("assets/images/Profile.png", width: 70, height: 70),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kelompok 5",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Fakultas Ilmu Komputer, Sistem Informasi",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey),

            // Kelola Akun
            const Text(
              "Kelola Akun",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            buildMenuItem(
              title: "Akun Saya",
              assetImage: "assets/images/akunsaya.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AkunSayaScreen()),
                );
              },
            ),
            buildMenuItem(
              title: "Push Notifikasi",
              assetImage: "assets/images/notification.png",
              onTap: () {
                // Logika aksi Push Notifikasi
              },
            ),
            buildMenuItem(
              title: "Log Out",
              assetImage: "assets/images/logout.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey),

            // Lainnya
            const Text(
              "Lainnya",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            buildMenuItem(
              title: "Dukungan & Bantuan",
              assetImage: "assets/images/bantuan.png",
              onTap: () {
                // Logika aksi Bantuan
              },
            ),
            buildMenuItem(
              title: "Tentang Aplikasi",
              assetImage: "assets/images/tentang.png",
              onTap: () {
                // Logika aksi Tentang Aplikasi
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Ionicons.home_outline), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Ionicons.compass_outline), label: 'Lainnya'),
          BottomNavigationBarItem(icon: Icon(Ionicons.school_outline), label: 'Akademik'),
          BottomNavigationBarItem(icon: Icon(Ionicons.mail_outline), label: 'Pesan'),
          BottomNavigationBarItem(icon: Icon(Ionicons.person_outline), label: 'Akun'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EventHomePage()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
      ),
    );
  }
}