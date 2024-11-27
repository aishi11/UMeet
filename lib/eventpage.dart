import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:umeet/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Outfit',
      ),
      home: const EventHomePage(),
    );
  }
}

class EventHomePage extends StatelessWidget {
  const EventHomePage({super.key});

  get query => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Latar belakang AppBar
        leading: Container(
          margin: const EdgeInsets.all(8.0), // Memberikan margin agar ada ruang
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Membuat latar lingkaran
            color: const Color.fromARGB(255, 26, 100, 160), // Warna latar biru
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.white), // Ikon back putih
            onPressed: () {
              Navigator.pop(context); // Aksi kembali ke halaman sebelumnya
            },
          ),
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman pencarian
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            query: '',
                          )), // Ganti dengan halaman pencarian
                );
              },
              child: const Icon(Icons.search,
                  color: Colors.grey), // Ikon kaca pembesar
            ),
            const SizedBox(
                width:
                    8), // Jarak kecil antara ikon kaca pembesar dan teks pencarian
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  // Ketika pengguna menekan Enter
                  if (value.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsPage(
                            query: value), // Navigasi ke halaman pencarian
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none, // Menghilangkan border
                ),
              ),
            ),
            const SizedBox(width: 10), // Jarak antara bilah pencarian dan menu
            // Tombol Menu
            IconButton(
              icon: const Icon(Icons.menu,
                  color: Color.fromARGB(255, 26, 100, 160)), // Menu biru
              onPressed: () {
                // Aksi tombol menu
                print("Tombol menu diklik!"); // Contoh aksi
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/menu.png'),
                  width: 900,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rekomendasi untuk anda',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll secara horizontal
              child: Row(
                children: const [
                  EventCard(
                    imageUrl: 'assets/images/frame1.png', // Gambar pertama
                    imageWidth: 250.0, // Lebar gambar pertama
                    imageHeight: 230.0, // Tinggi gambar pertama
                  ),
                  SizedBox(width: 16), // Jarak antara gambar pertama dan kedua
                  EventCard(
                    imageUrl: 'assets/images/frame2.png', // Gambar kedua
                    imageWidth: 250.0, // Lebar gambar kedua
                    imageHeight: 230.0, // Tinggi gambar kedua
                  ),
                  SizedBox(width: 16), // Jarak antara gambar kedua dan ketiga
                  EventCard(
                    imageUrl: 'assets/images/frame3.png', // Gambar ketiga
                    imageWidth: 250.0, // Lebar gambar ketiga
                    imageHeight: 230.0, // Tinggi gambar ketiga
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Terakhir dilihat',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll secara horizontal
              child: Row(
                children: const [
                  EventCard(
                    imageUrl: 'assets/images/acara1.png', // Gambar pertama
                    imageWidth: 200.0, // Lebar gambar pertama
                    imageHeight: 90.0, // Tinggi gambar pertama
                  ),
                  SizedBox(width: 16),
                  EventCard(
                    imageUrl: 'assets/images/acara2.png', // Gambar kedua
                    imageWidth: 200.0, // Lebar gambar kedua
                    imageHeight: 90.0, // Tinggi gambar kedua
                  ),
                  SizedBox(width: 16),
                  EventCard(
                    imageUrl: 'assets/images/acara3.png', // Gambar ketiga
                    imageWidth: 200.0, // Lebar gambar ketiga
                    imageHeight: 90.0, // Tinggi gambar ketiga
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Center(
                child: Image(
                  image: AssetImage('assets/images/grup.png'),
                  width: 600,
                  height: 35,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll secara horizontal
              child: Row(
                children: const [
                  EventCard(
                    imageUrl: 'assets/images/frame4.png', // Gambar pertama
                    imageWidth: 250.0, // Lebar gambar pertama
                    imageHeight: 230.0, // Tinggi gambar pertama
                  ),
                  SizedBox(width: 16),
                  EventCard(
                    imageUrl: 'assets/images/frame5.png', // Gambar kedua
                    imageWidth: 250.0, // Lebar gambar kedua
                    imageHeight: 230.0, // Tinggi gambar kedua
                  ),
                  SizedBox(width: 16),
                  EventCard(
                    imageUrl: 'assets/images/frame6.png', // Gambar ketiga
                    imageWidth: 250.0, // Lebar gambar ketiga
                    imageHeight: 230.0, // Tinggi gambar ketiga
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required String query});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> recentSearches = [
    'webinar teknologi',
    'saham',
    'ekonomi kreatif',
    'kesehatan lingkungan',
    'workshop',
    'AI',
  ];

  final List<String> suggestions = [
    'Fasilkom',
    'Sriwijaya Berpesta',
    'HIMSI Fasilkom Unsri',
    'BEM FISIP Unsri',
  ];

  void clearAllResults() {
    setState(() {
      recentSearches.clear();
    });
  }

  void removeResult(String result) {
    setState(() {
      recentSearches.remove(result);
    });
  }

  void search(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(query: query),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Latar belakang AppBar
        leading: Container(
          margin: const EdgeInsets.all(8.0), // Memberikan margin agar ada ruang
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // Membuat latar lingkaran
            color: Color.fromARGB(255, 26, 100, 160), // Warna latar biru
          ),
          child: IconButton(
  icon: const Icon(Icons.arrow_back, color: Colors.white), // Ikon back putih
  onPressed: () {
    // Arahkan kembali ke halaman home dan hapus semua halaman yang ada di stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Ganti dengan HomePage Anda
      (route) => false, // Menghapus semua halaman sebelumnya dari stack
    );
  },
),
        ),
        title: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey), // Ikon kaca pembesar
            const SizedBox(
                width:
                    8), // Jarak kecil antara ikon kaca pembesar dan bilah pencarian
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  // Ketika pengguna menekan Enter
                  if (value.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsPage(
                            query:
                                value), // Navigasi ke halaman hasil pencarian
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none, // Menghilangkan border
                ),
              ),
            ),
            const SizedBox(width: 10), // Jarak antara bilah pencarian dan menu
            // Tombol Menu
            IconButton(
              icon: const Icon(Icons.menu,
                  color: Color.fromARGB(255, 26, 100, 160)), // Menu biru
              onPressed: () {
                // Aksi tombol menu
                print("Tombol menu diklik!"); // Contoh aksi
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(recentSearches[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            removeResult(recentSearches[index]);
                          },
                        ),
                        onTap: () {
                          search(recentSearches[index]);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: clearAllResults,
                    child: const Text(
                      'Clear all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Kamu mungkin suka',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        index < 2
                            ? Icons.circle_rounded
                            : Icons.circle_outlined,
                        color: index < 2 ? Colors.yellow : Colors.grey,
                      ),
                      title: Text(suggestions[index]),
                      onTap: () {
                        search(suggestions[index]);
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Give feedback',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(8), // Memberikan jarak ke tepi
          decoration: const BoxDecoration(
            color: Color.fromARGB(
                255, 26, 100, 160), // Warna biru untuk latar lingkaran
            shape: BoxShape.circle, // Membentuk latar menjadi lingkaran
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.white), // Ikon back dengan warna putih
            onPressed: () {
              Navigator.pop(context); // Navigasi kembali
            },
          ),
        ),
        title: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey), // Ikon kaca pembesar
            const SizedBox(
                width: 8), // Jarak kecil antara ikon dan teks pencarian
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: query, // Menampilkan teks pencarian
                  border: InputBorder.none, // Menghilangkan border
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Tombol Menu
            IconButton(
              icon: const Icon(Icons.menu,
                  color: Color.fromARGB(255, 26, 100, 160)), // Menu biru
              onPressed: () {
                // Aksi tombol menu
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          children: [
            const Text(
              'Hasil Pencarian',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Gambar pertama
                        GestureDetector(
                          onTap: () {
                            // Aksi ketika gambar pertama diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailTiketPage()),
                            );
                          },
                          child: Container(
                            width: 420,
                            height: 400,
                            margin: const EdgeInsets.only(
                                bottom: 10), // Jarak bawah gambar
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/event3.png'), // Path gambar pertama
                                fit: BoxFit
                                    .contain, // Menyesuaikan gambar agar tidak terpotong
                              ),
                            ),
                          ),
                        ),
                        // Event Card pertama
                        Container(
                          width: 420,
                          height: 300,
                          margin: const EdgeInsets.only(
                              bottom: 30), // Jarak antar event card
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/event4.png'), // Path gambar event card pertama
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // Event Card kedua
                        Container(
                          width: 420,
                          height: 300,
                          margin: const EdgeInsets.only(
                              bottom: 30), // Jarak antar event card
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/event5.png'), // Path gambar event card kedua
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailTiketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 100, 160),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          "Detail Tiket",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      body: SingleChildScrollView( // Membungkus dengan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/formimage.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "SI FEST 2023",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "HIMSI FASILKOM UNSRI",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "12 November 2023",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Grand Ballroom Ayola Hotel Palembang",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Nama",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Email Aktif",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Nomor WhatsApp Aktif",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _showSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 26, 100, 160),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "KONFIRMASI",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          true, // Supaya pop-up bisa ditutup dengan klik di luar
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/daftarberhasil.png', // Ganti dengan gambar centang dari Figma
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Pendaftaran Berhasil",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 26, 100, 160),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      // Kembali ke halaman sebelumnya setelah pop-up ditutup
      Navigator.pop(context);
    });
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 80.0,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: 130.0,
            height: 70.0,
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;

  const EventCard({
    super.key,
    required this.imageUrl,
    this.imageWidth = 380.0, // Default width jika tidak diberi nilai
    this.imageHeight = 250.0, // Default height jika tidak diberi nilai
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth + 20.0, // Sesuaikan dengan ukuran gambar + padding
      height: imageHeight + 20.0, // Sesuaikan dengan ukuran gambar + padding
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imageUrl,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit
                .cover, // Agar gambar terpotong dengan rapi jika ukuran tidak sesuai
          ),
        ),
      ),
    );
  }
}

class TopNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const TopNavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, color: Colors.blue),
        ),
      ],
    );
  }
}

class CategoryNavItem extends StatelessWidget {
  final String label;

  const CategoryNavItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
    );
  }
}
