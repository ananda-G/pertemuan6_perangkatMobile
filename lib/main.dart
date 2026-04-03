import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Aplikasi Buku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar 10 Buku Pilihan'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  // DATA 10 BUKU
  final List<Map<String, dynamic>> daftarBuku = const [
    {"judul": "Pemrograman Web Dasar", "penulis": "Ananda", "image": "cover1.jpg", "pdf": "buku1.pdf"},
    {"judul": "Buku Sakti Python", "penulis": "Ananda", "image": "cover2.jpg", "pdf": "buku2.pdf"},
    {"judul": "Logika & Algoritma", "penulis": "Ananda", "image": "cover3.jpg", "pdf": "buku3.pdf"},
    {"judul": "Belajar Dasar C++", "penulis": "Ananda", "image": "cover4.jpg", "pdf": "buku4.pdf"},
    {"judul": "Pemrograman Java", "penulis": "Ananda", "image": "cover5.jpg", "pdf": "buku5.pdf"},
    {"judul": "7 in 1 Pemrograman Web", "penulis": "Ananda", "image": "cover6.jpg", "pdf": "buku6.pdf"},
    {"judul": "Desain Web PHP", "penulis": "Ananda", "image": "cover7.jpg", "pdf": "buku7.pdf"},
    {"judul": "Sistem Pakar AI", "penulis": "Ananda", "image": "cover8.jpg", "pdf": "buku8.pdf"},
    {"judul": "Pengantar Mikrokontroler", "penulis": "Ananda", "image": "cover9.jpg", "pdf": "buku9.pdf"},
    {"judul": "Pemrograman Scratch", "penulis": "Ananda", "image": "cover10.jpg", "pdf": "buku10.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: daftarBuku.length,
        itemBuilder: (context, index) {
          final buku = daftarBuku[index];
          return ProductBox(
            judul: buku["judul"],
            penulis: buku["penulis"],
            image: buku["image"],
            pdf: buku["pdf"],
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.judul,
    required this.penulis,
    required this.image,
    required this.pdf,
  });

  final String judul;
  final String penulis;
  final String image;
  final String pdf;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                "assets/appimages/$image",
                width: 80,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.book, size: 80, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Penulis: $penulis", style: const TextStyle(color: Colors.grey)),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanBacaPDF(judulBuku: judul, filePdf: pdf),
                        ),
                      );
                    },
                    icon: const Icon(Icons.picture_as_pdf, size: 16),
                    label: const Text("Read the book"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HalamanBacaPDF extends StatelessWidget {
  final String judulBuku;
  final String filePdf;

  const HalamanBacaPDF({super.key, required this.judulBuku, required this.filePdf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judulBuku, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      // PERBAIKAN: folder harus 'pdfs' sesuai pubspec.yaml
      body: SfPdfViewer.asset('assets/pdfs/$filePdf'),
    );
  }
}