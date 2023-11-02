import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Fresh news happening today, worldwide.',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                fontFamily: GoogleFonts.lato().fontFamily,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => const NewsCard(),
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title'),
              Text('Subtitle'),
              Text('Additional Info'),
            ],
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              'https://picsum.photos/200/300',
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
