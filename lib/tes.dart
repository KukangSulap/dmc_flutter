import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Discover new places',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlaceCard(
                    name: 'Paris',
                    imageUrl: 'https://picsum.photos/200',
                  ),
                  PlaceCard(
                    name: 'Tokyo',
                    imageUrl: 'https://picsum.photos/200',
                  ),
                  PlaceCard(
                    name: 'New York',
                    imageUrl: 'https://picsum.photos/200',
                  ),
                  PlaceCard(
                    name: 'Sydney',
                    imageUrl: 'https://picsum.photos/200',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Popular Destinations',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  PlaceCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        imageUrl,
        height: 150.0,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(height: 8.0),
    Text(
    name
    ),
          ],
      ),
    );
  }
}