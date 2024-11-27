import 'package:flutter/material.dart';

class EventTerdaftar extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "image": "assets/images/event8.png",
      "date": "12 November 2023",
      "title": "SI Fest 2023",
      "description": "Artificial Intelligence, Is It a Good Thing or Bad Thing?",
      "organizer": "HIMSI FASILKOM UNSRI"
    },
    {
      "image": "assets/images/pamflet3.jpg",
      "date": "15 April 2024",
      "title": "IFFEST 2024",
      "description": "Ignite The Competition: Sparks of Informatics",
      "organizer": "HMIF FASILKOM UNSRI"
    },
    {
      "image": "assets/images/pamflet2.jpg",
      "date": "20 April 2024",
      "title": "Recruitment",
      "description": "The Next INTEL: Innovation in Leadership and Teamwork",
      "organizer": "BO INTEL FASILKOM UNSRI"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Kamu Terdaftar disini"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Tambahkan logika untuk menu
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    event["image"]!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event["date"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event["title"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event["description"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            event["organizer"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.group),
                                onPressed: () {
                                  // Logika untuk tombol grup
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.chat),
                                onPressed: () {
                                  // Logika untuk tombol chat
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
