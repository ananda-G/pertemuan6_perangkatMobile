import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookListScreen(),
    ),
  );
}

class BookListScreen extends StatelessWidget {
  BookListScreen({super.key});

  final List<Map<String, String>> books = [
    {
      'title': 'Algorithms to Live By',
      'author': 'Brian Christian',
      'description': 'Book about computer science and human decisions.',
      'pdf': 'assets/pdfs/buku1.pdf',
    },
    {
      'title': 'Beginning Programming',
      'author': 'Wallace Wang',
      'description': 'Introduction to programming concepts.',
      'pdf': 'assets/pdfs/buku2.pdf',
    },
    {
      'title': 'Streamlit for Data Science',
      'author': 'Tyler Richards',
      'description': 'Interactive data apps using Python.',
      'pdf': 'assets/pdfs/buku3.pdf',
    },
    {
      'title': 'Flutter Basics',
      'author': 'John Smith',
      'description': 'Learn Flutter from scratch.',
      'pdf': 'assets/pdfs/buku4.pdf',
    },
    {
      'title': 'Mobile App Design',
      'author': 'Sarah Johnson',
      'description': 'UI/UX design for mobile apps.',
      'pdf': 'assets/pdfs/buku5.pdf',
    },
    {
      'title': 'Dart Programming',
      'author': 'Michael Lee',
      'description': 'Complete guide to Dart language.',
      'pdf': 'assets/pdfs/buku6.pdf',
    },
    {
      'title': 'Android Studio Guide',
      'author': 'David Brown',
      'description': 'Learn Android Studio tools.',
      'pdf': 'assets/pdfs/buku7.pdf',
    },
    {
      'title': 'Database for Mobile',
      'author': 'Linda White',
      'description': 'Using SQLite and Firebase.',
      'pdf': 'assets/pdfs/buku8.pdf',
    },
    {
      'title': 'API Integration',
      'author': 'James Wilson',
      'description': 'Connect mobile apps with REST API.',
      'pdf': 'assets/pdfs/buku9.pdf',
    },
    {
      'title': 'Advanced Flutter',
      'author': 'Emma Davis',
      'description': 'Advanced widgets and routing.',
      'pdf': 'assets/pdfs/buku10.pdf',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List (${books.length} Books)'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: books[index]['title']!,
                    author: books[index]['author']!,
                    description: books[index]['description']!,
                    pdfPath: books[index]['pdf']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String pdfPath;

  const BookDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.pdfPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $title',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Author: $author',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Description: $description',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfScreen(pdfPath: pdfPath),
                  ),
                );
              },
              child: const Text('Read the Book'),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfScreen extends StatelessWidget {
  final String pdfPath;

  const PdfScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Book PDF'),
      ),
      body: SfPdfViewer.asset(pdfPath),
    );
  }
}