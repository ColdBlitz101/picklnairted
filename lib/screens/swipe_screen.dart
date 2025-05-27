import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final List<String> options = [
    'Sushi 🍣',
    'Pizza 🍕',
    'Tacos 🌮',
    'Burgers 🍔',
    'Pasta 🍝',
    'Ramen 🍜',
  ];

  late final MatchEngine _matchEngine;

  List<String> accepted = [];
  List<String> rejected = [];

  static const Color picklGreen = Color(0xFF47EA99);

  @override
  void initState() {
    super.initState();

    List<SwipeItem> swipeItems = options.map((option) {
      return SwipeItem(
        content: option,
        likeAction: () {
          accepted.add(option);
        },
        nopeAction: () {
          rejected.add(option);
        },
        superlikeAction: () {},
      );
    }).toList();

    _matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [picklGreen, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
        child: Column(
          children: [
            Text(
              'Swipe to Pick!',
              style: GoogleFonts.rubik(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Swipe right to say yes, left to pass',
              style: GoogleFonts.rubik(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Expanded(
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  final option = options[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        option,
                        style: GoogleFonts.rubik(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'All done!\n✅ Yes: ${accepted.join(", ")}\n❌ No: ${rejected.join(", ")}',
                        style: GoogleFonts.rubik(fontSize: 14),
                      ),
                      backgroundColor: Colors.black87,
                      duration: const Duration(seconds: 5),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                itemChanged: (SwipeItem item, int index) {
                  // Optional: do something
                },
                upSwipeAllowed: false,
                fillSpace: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
