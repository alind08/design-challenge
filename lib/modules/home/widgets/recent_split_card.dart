import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentSplitCard extends StatelessWidget {
  const RecentSplitCard({
    super.key,
    required this.avatarBgColor,
    required this.imagePath,
    required this.name,
  });

  final Color avatarBgColor;
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: avatarBgColor,
            ),
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
