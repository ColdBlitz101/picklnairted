import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DecisionScreen extends StatelessWidget {
  final List<String> accepted;
  final List<String> rejected;

  const DecisionScreen({
    Key? key,
    required this.accepted,
    required this.rejected,
  }) : super(key: key);

  static const Color picklGreen = Color(0xFF47EA99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: picklGreen,
      appBar: AppBar(
        backgroundColor: picklGreen,
        elevation: 0,
        title: Text('Your Choices', style: GoogleFonts.rubik(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [picklGreen, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('✅ Accepted:', style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...accepted.map((item) => Text('• $item', style: GoogleFonts.rubik(fontSize: 16))),
            const SizedBox(height: 24),
            Text('❌ Rejected:', style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...rejected.map((item) => Text('• $item', style: GoogleFonts.rubik(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
