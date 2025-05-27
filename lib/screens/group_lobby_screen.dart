import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'swipe_screen.dart'; // Adjust path as needed

class GroupLobbyScreen extends StatelessWidget {
  const GroupLobbyScreen({Key? key}) : super(key: key);

  static const Color picklGreen = Color(0xFF47EA99);

  // Dummy members (replace with real data later)
  final List<String> members = const ['Alice', 'Bob', 'Charlie', 'You'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
            // Back Button
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),

            // Title
            Center(
              child: Text(
                'Jar Lobby',
                style: GoogleFonts.rubik(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Subheader
            Center(
              child: Text(
                'Waiting for players to join...',
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),

            // Players title
            Text(
              'Players in this jar:',
              style: GoogleFonts.rubik(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Member list container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(12),
                child: ListView.separated(
                  itemCount: members.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: picklGreen,
                        child: Text(
                          members[index][0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        members[index],
                        style: GoogleFonts.rubik(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Start Jar Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Starting jar...")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: picklGreen,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Start Jar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Start Swiping Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SwipeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Start Swiping',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
