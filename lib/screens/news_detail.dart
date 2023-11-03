import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newspoint/model/articlemodel.dart';
import 'package:newspoint/services/formatter.dart';

class NewsDetailScreen extends StatelessWidget {
  final ArticleModel data;
  const NewsDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title ?? 'No Title',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text('Author : ${data.author}'),
            const SizedBox(height: 8),
            Text('Source : ${data.source?.name ?? 'no source'}'),
            const SizedBox(height: 8),
            Text(
              'Published : ${Formatter.formatDate(data.publishedAt.toString())}',
            ),
            const SizedBox(height: 16),
            Text(
              data.description ?? 'No description',
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              data.content ?? 'No Content',
              style: TextStyle(
                fontFamily: GoogleFonts.merriweather().fontFamily,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
