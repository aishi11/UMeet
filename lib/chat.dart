import 'package:flutter/material.dart';
import 'package:umeet/main.dart';
import 'placeholder_screen.dart';
import 'recruitment_details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pesan',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Add your notification logic here
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildMessageCard(
              context,
              'OPEN RECRUITMENT BO INTEL',
              'Looking to level up your English skills and dive into opportunities?',
              RecruitmentDetailsScreen(),
              Icons.work_outline,
              Colors.blueAccent,
            ),
            buildMessageCard(
              context,
              'SAYEMBARA KETUA PELAKSANA PKKMB',
              'Siapa yang sudah tidak sabar lagi untuk mengikuti PKKMB?',
              PlaceholderScreen(),
              Icons.event,
              Colors.green,
            ),
            buildMessageCard(
              context,
              'PEKAN SENI MAHASISWA NASIONAL',
              'Calling out mahasiswa seluruh perguruan tinggi Republik.',
              PlaceholderScreen(),
              Icons.palette,
              Colors.purple,
            ),
            buildMessageCard(
              context,
              'WEBINAR DATA SECURE',
              'Introducing.. “Data Avengers: Uniting Forces Against Cyber.',
              PlaceholderScreen(),
              Icons.security,
              Colors.orange,
            ),
            buildMessageCard(
              context,
              'BEASISWA PERTAMINA SOBAT BUMI 2024',
              'Pertamina mencari anda! segera daftarkan diri anda 22 Januari.',
              PlaceholderScreen(),
              Icons.school,
              Colors.redAccent,
            ),
            buildMessageCard(
              context,
              'GOOGLE SOLUTION CHALLENGE 2024',
              'Did you know that Google Solution Challenge mission is to innovate?',
              PlaceholderScreen(),
              Icons.lightbulb_outline,
              Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageCard(
    BuildContext context,
    String title,
    String description,
    Widget targetScreen,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
      ),
    );
  }
}