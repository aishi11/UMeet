import 'package:flutter/material.dart';
import 'package:umeet/eventpage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:umeet/review.dart';
import 'package:umeet/splash_page.dart';
import 'package:umeet/screens/account_screen.dart';
import 'package:umeet/chat.dart';
import 'package:umeet/eventdaftar.dart';
import 'package:umeet/favorite.dart';
import 'package:umeet/terdaftar.dart';
import 'package:umeet/sertifikat.dart';

void main() {
  runApp(UMeetApp());
}

class UMeetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Menyimpan index dari tab yang aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'), 
            fit: BoxFit.cover, // Mengisi layar
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with name
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'U',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            color: Colors.yellow, // Warna kuning untuk "U"
                          ),
                        ),
                        TextSpan(
                          text: '-Meet',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF3470a2), // Ganti warna biru sesuai kode hex
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/User_image.jpg'), // Ganti dengan path gambar yang benar
                    radius: 30,
                  ),
                ],
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'Selamat Datang,  ', // Teks biasa
                  style: TextStyle(color: Colors.black, fontFamily: 'outfit'), // Warna abu-abu untuk teks biasa
                  children: <TextSpan>[
                    TextSpan(
                      text: 'KELOMPOK 5', // Teks yang ingin diwarnai biru
                      style: TextStyle(
                        color: Colors.black, fontFamily: 'outfit', fontWeight: FontWeight.bold // Ubah warna menjadi biru
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'Anda telah mengikuti ', // Teks biasa
                  style: TextStyle(color: Colors.grey, fontFamily: 'outfit'), // Warna abu-abu untuk teks biasa
                  children: <TextSpan>[
                    TextSpan(
                      text: '3 Kegiatan bulan ini', // Teks yang ingin diwarnai biru
                      style: TextStyle(
                        color: Colors.blue, fontFamily: 'outfit' // Ubah warna menjadi biru
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Activity Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk kolom "Mengikuti"
                    children: [
                      Text(
                        'Mengikuti',
                        style: TextStyle(fontSize: 12, fontFamily: 'outfit'),
                      ),
                      Row(
                        children: [
                          Icon(Ionicons.person_outline, size: 24, color: Colors.yellow), // Ikon grup di kiri
                          SizedBox(width: 8), // Jarak antara ikon dan teks
                          Text(
                            '10 Penyelenggara',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'outfit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Garis pemisah vertikal
                  Container(
                    width: 1,
                    height: 50, // Atur tinggi garis sesuai kebutuhan
                    color: Colors.grey, // Warna garis
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk kolom "Sertifikat"
                    children: [
                      Text(
                        'Sertifikat',
                        style: TextStyle(fontSize: 12, fontFamily: 'outfit'),
                      ),
                      Row(
                        children: [
                          Icon(Ionicons.ribbon_outline, size: 24, color: Colors.yellow), // Ikon sertifikat di kiri
                          SizedBox(width: 8), // Jarak antara ikon dan teks
                          Text(
                            '3 Sertifikat',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'outfit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Garis bawah
              Container(
                height: 1, // Ketebalan garis bawah
                color: Colors.grey, // Warna garis bawah
              ),
              SizedBox(height: 20),
              // Upcoming Activity
              Text('Kegiatan Mendatang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily : 'outfit')),
              Row(
              mainAxisAlignment: MainAxisAlignment.start, // Posisi rata kiri
                children: [
                  OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.1), // Warna biru transparan
                    side: BorderSide(color: Colors.blue), // Garis outline berwarna biru
                    minimumSize: Size(80, 30), // Ukuran lebih kecil
                    padding: EdgeInsets.symmetric(horizontal: 12), // Padding lebih kecil
                  textStyle: TextStyle(fontSize: 12, fontFamily: 'outfit', color: Colors.blue), // Teks lebih kecil dan berwarna biru
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountScreen()),
                    );
                  },
                  child: Text('Sedang Diikuti'),
                  ),
              SizedBox(width: 8), // Jarak lebih dekat antara tombol
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna biru transparan
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(80, 30), // Ukuran lebih kecil
                  padding: EdgeInsets.symmetric(horizontal: 10), // Padding lebih kecil
                  textStyle: TextStyle(fontSize: 12, fontFamily: 'outfit'), // Teks lebih kecil
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
                child: Text('Disimpan'),
              ),
              ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Hari ini, 08:00', style: TextStyle(fontFamily: 'outfit', fontSize: 13)),
                      ],
                    ),
                    Text('IF FEST 2024',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'outfit')),
                    Row(
                      children: [
                        Icon(Ionicons.people_circle_outline, size: 18), // Ikon di sebelah kiri
                        SizedBox(width: 5), // Jarak antara ikon dan teks
                        Text(
                          'HMIF Fasilkom Unsri',
                          style: TextStyle(fontFamily: 'outfit', fontSize: 13), // Gaya teks
                        ),
                      ], 
                    ),
                    SizedBox(height: 5), // Jarak antara ikon dan teks
                    Row(
                      children: [
                        Text('Diikuti oleh',
                        style: TextStyle(
                            fontSize: 12, fontFamily: 'outfit')),
                        SizedBox(width: 5),
                        CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/images/user1.png')),
                        CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/images/user2.png')),
                        CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/images/user3.png')),
                        CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/images/user4.png')),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Event Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jelajahi event', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  GestureDetector(
                    onTap: () {
                      // Arahkan ke halaman lain di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>EventHomePage()), // Ganti dengan halaman yang sesuai
                      );
                    },
                    child: Text('lainnya', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                color: Colors.white, // Warna abu-abu
                padding: EdgeInsets.all(8), // Padding opsional agar tidak terlalu mepet
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min, // Menghindari kolom mengambil ruang vertikal berlebih
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventTerdaftar()),
                            );
                          },
                          child: CircleAvatar(
                          backgroundColor: Colors.blue, // Lingkaran biru
                          radius: 24, // Ukuran lingkaran
                          child: Icon(Ionicons.id_card_outline, color: Colors.white), // Ikon di dalam lingkaran
                        ),
                        ),
                        SizedBox(height: 8), // Jarak antara ikon dan label
                        Text('Terdaftar'),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventFavorite()),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 24,
                            child: Icon(Icons.favorite_outline, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Favorit'),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventReviewPage()),
                            );
                          },
                          child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 24,
                          child: Icon(Ionicons.time_outline, color: Colors.white),
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('Riwayat'),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventCertificatePage()),
                            );
                          },
                          child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 24,
                          child: Icon(Ionicons.document_text_outline, color: Colors.white),
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('Sertifikat'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Organizers Section
              Text('Penyelenggara', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'outfit')),
              SizedBox(height: 8),
              Container(
                color: Colors.white, // Warna abu-abu
                padding: EdgeInsets.all(8), // Tambahkan padding opsional
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OrganizerLogo('assets/images/himsi-logo.png'),
                      SizedBox(width: 16), // Menambah jarak antara logo
                      OrganizerLogo('assets/images/bem.jpg'),
                      SizedBox(width: 16),
                      OrganizerLogo('assets/images/hmif.jpg'),
                      SizedBox(width: 16),
                      OrganizerLogo('assets/images/intel.jpg'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Event Cards
             Text('Rekomendasi untuk anda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'outfit')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Scroll horizontal
                  child: Row(
                    children: [
                      // Event Card 1
                      EventCard(
                        title: 'Pertamina Goes to Campus',
                        organizer: 'CDC Unsri',
                        date: '5 Mei 2024',
                        attendees: 3,
                        imagePath: 'assets/images/Pamflet1.png', // Gambar yang berbeda
                        subTitle: 'Seminar dan Diskusi Kampus',
                      ),
                      // Event Card 2
                      EventCard(
                      title: 'SEMINAR SI FEST 2023',
                      organizer: 'HIMSI UNSRI',
                      date: '8 Mei 2023',
                      attendees: 5,
                      imagePath: 'assets/images/event8.png', // Gambar yang berbeda
                      subTitle: 'Seminar IT Nasional',
                      onTap: () {
                        print('Navigating to EventDetailPage');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailPage(),
                          ),
                        );
                      },
                    ),

                      // Event Card 3
                      EventCard(
                        title: 'Seminar Nasional IT',
                        organizer: 'IT Club',
                        date: '12 Mei 2024',
                        attendees: 4,
                        imagePath: 'assets/images/pamflet3.jpg', // Gambar yang berbeda
                        subTitle: 'Inovasi Teknologi Terbaru',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Calendar
              Text('Kalender anda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              CalendarWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Ionicons.home_outline), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Ionicons.compass_outline), label: 'Lainnya'),
          BottomNavigationBarItem(icon: Icon(Ionicons.school_outline), label: 'Akademik'),
          BottomNavigationBarItem(icon: Icon(Ionicons.mail_outline), label: 'Pesan'),
          BottomNavigationBarItem(icon: Icon(Ionicons.person_outline), label: 'Akun'),
        ],
        currentIndex: _currentIndex, // Menampilkan tab yang aktif
        selectedItemColor: Colors.yellow, // Warna item yang dipilih
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 4) {
            // Jika ikon Akun dipencet, pindah ke halaman profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountScreen()),
            );
          }
          if (index == 0){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (index == 1){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => EventHomePage()),
            );
          }
          if (index == 3){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
      ),
    );
  }
}

// Custom Widgets

class StatCard extends StatelessWidget {
  final String title;
  final IconData icon;

  StatCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class OrganizerLogo extends StatelessWidget {
  final String imagePath;

  OrganizerLogo(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 30,
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String organizer;
  final String date;
  final int attendees;
  final String imagePath;
  final String subTitle;
  final VoidCallback? onTap;

  EventCard({
    required this.title,
    required this.organizer,
    required this.date,
    required this.attendees,
    required this.imagePath,
    required this.subTitle,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Tambahkan aksi klik
      child: Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar di atas
          Image.asset(
            imagePath, // Gambar berbeda untuk setiap kartu
            fit: BoxFit.cover,
            width: 200, // Ukuran lebar yang pas untuk scroll horizontal
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Baris dengan tanggal dan gambar pengguna
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tanggal di sebelah kiri dengan ukuran font 8
                    Text(
                      date,
                      style: TextStyle(fontSize: 8, fontFamily: 'outfit'),
                    ),
                    // Gambar profil kecil pengguna di sebelah kanan
                    Row(
                      children: List.generate(attendees, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: CircleAvatar(
                            radius: 10, // Ukuran kecil
                            backgroundImage: AssetImage(
                              'assets/images/user${index + 1}.png', // Gambar user di assets
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Judul event
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                // Sub judul di bawah judul
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                // Baris dengan penyelenggara di sebelah kiri, bookmark dan link di sebelah kanan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Penyelenggara di sebelah kiri
                    Text(
                      organizer,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[800],
                      ),
                    ),
                    // Ikon bookmark dan ikon link di sebelah kanan
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Ionicons.bookmark_outline, size: 18),
                          onPressed: () {
                            // Aksi simpan event
                          },
                        ),
                        IconButton(
                          icon: Icon(Ionicons.link_outline, size: 18),
                          onPressed: () {
                            // Aksi buka tautan
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
    ),
    );
  }
}


class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update focused day
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}

