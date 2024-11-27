import 'package:flutter/material.dart';
import 'package:umeet/main.dart';

class SeminarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicketDetailPage()),
            );
          },
          child: Text("Pilih Tiket"),
        ),
      ),
    );
  }
}

class TicketDetailPage extends StatelessWidget {
  TicketDetailPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Detail Tiket'),
        centerTitle: true,
      ),
      body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: SingleChildScrollView( // Tambahkan SingleChildScrollView
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/formimage.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(width: 16.0),
    Expanded( // Tambahkan Expanded
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'SI FEST 2023',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text('HIMSI FASILKOM UNSRI'),
          Text('12 November 2023'),
          Text('Grand Ballroom Ayola Hotel Palembang'),
        ],
      ),
    ),
  ],
),
        const SizedBox(height: 24.0),
        const Text('Nama', style: TextStyle(fontSize: 16.0)),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Masukkan nama Anda',
          ),
        ),
        const SizedBox(height: 16.0),
        const Text('Email Aktif', style: TextStyle(fontSize: 16.0)),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Masukkan email aktif Anda',
          ),
        ),
        const SizedBox(height: 16.0),
        const Text('Nomor WhatsApp Aktif',
            style: TextStyle(fontSize: 16.0)),
        TextField(
          controller: whatsappController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Masukkan nomor WhatsApp Anda',
          ),
        ),
        const SizedBox(height: 24.0),
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  whatsappController.text.isNotEmpty) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    Future.delayed(Duration(seconds: 10), () {
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                    });
                    return RegistrationSuccessPage();
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Peringatan'),
                      content: const Text(
                          'Harap lengkapi semua data sebelum konfirmasi.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('KONFIRMASI'),
          ),
        ),
      ],
    ),
  ),
),
    );
  }
}

class RegistrationSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => HomePage()),
    (route) => false, // Menghapus semua route sebelumnya
  );
});
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/daftarberhasil.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 16),
          const Text(
            "Pendaftaran Berhasil",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
