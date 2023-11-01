import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Personalized news, only for you.',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
              fontFamily: GoogleFonts.lato().fontFamily,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
