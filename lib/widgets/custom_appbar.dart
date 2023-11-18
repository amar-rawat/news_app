import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.dancingScript(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    );
  }
}
