import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BookListScreen(),
  ));
}

class BookListScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Algorithms to Live By',
      'author': 'Brian Christian',
      'description': 'Book about computer science and human decisions.'
    },
    {
      'title': 'Beginning Programming',
      'author': 'Wallace Wang',
      'description': 'Introduction to programming concepts.'
    },
    {
      'title': 'Streamlit for Data Science',
      'author': 'Tyler Richards',
      'description': 'Interactive data apps using Python.'
    },
    {
      'title': 'Flutter Basics',
      'author': 'John Smith',
      'description': 'Learn Flutter from scratch.'
    },
    {
      'title': 'Mobile App Design',
      'author': 'Sarah Johnson',
      'description': 'UI/UX design for mobile apps.'
    },
    {
      'title': 'Dart Programming',
      'author': 'Michael Lee',
      'description': 'Complete guide to Dart language.'
    },
    {
      'title': 'Android Studio Guide',
      'author': 'David Brown',
      'description': 'Learn Android Studio tools.'
    },
    {
      'title': 'Database for Mobile',
      'author': 'Linda White',
      'description': 'Using SQLite and Firebase.'
    },
    {
      'title': 'API Integration',
      'author': 'James Wilson',
      'description': 'Connect mobile apps with REST API.'
    },
    {
      'title': 'Advanced Flutter',
      'author': 'Emma Davis',
      'description': 'Advanced widgets and routing.'
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

  BookDetailScreen({
    required this.title,
    required this.author,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $title',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Author: $author',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadingBookFile(),
                  ),
                );
              },
              child: Text('Read the Book'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadingBookFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading Book'),
      ),
      body: Center(
        child: Text(
          'This is the reading page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}