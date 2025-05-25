import 'package:flutter/material.dart';
import 'swipe_screen.dart'; // Adjust path as needed

class GroupLobbyScreen extends StatelessWidget {
  const GroupLobbyScreen({Key? key}) : super(key: key);

  static const Color picklGreen = Color(0xFF6ABF4B);

  // Dummy members (replace with real data later)
  final List<String> members = const ['Alice', 'Bob', 'Charlie', 'You'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: picklGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),

              // Title
              const Center(
                child: Text(
                  'Jar Lobby',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  'Waiting for players to join...',
                  style: TextStyle(fontSize: 16, color: Color(0xFFE8FBE2)),
                ),
              ),

              const SizedBox(height: 24),

              // Members section
              const Text(
                'Players in this jar:',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              // Member list
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
                        title: Text(members[index]),
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
                    backgroundColor: Colors.white,
                    foregroundColor: picklGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Start Jar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                    backgroundColor: Colors.white,
                    foregroundColor: picklGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Start Swiping',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
