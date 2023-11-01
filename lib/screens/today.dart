import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Fresh news for you today.',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
              fontFamily: GoogleFonts.lato().fontFamily,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
                // height: 1,
                // color: Colors.transparent,
                ),
            itemBuilder: (context, index) => ListTile(
              // shape: const OutlineInputBorder(
              //   borderRadius: BorderRadius.zero,
              //   // borderSide: BorderSide(
              //   //   color: Colors.grey,
              //   // ),
              // ),
              leading: Image.network(
                'https://picsum.photos/200/300',
                fit: BoxFit.fill,
              ),
              title: Text(
                'Halo',
                style: TextStyle(
                  fontFamily: GoogleFonts.merriweather().fontFamily,
                  fontSize: 16,
                ),
              ),
              subtitle: const Text(
                  'ajshdkjahsdkahskdhakshdkahsdhaskhdkjasjdhakshdkahskhj'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
