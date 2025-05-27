import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'decision_screen.dart';

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

  final List<String> accepted = [];
  final List<String> rejected = [];

  static const Color picklGreen = Color(0xFF47EA99);
  static const Color picklLightGreen = Color(0xFFE8FBE2);

  @override
  void initState() {
    super.initState();

    final swipeItems = options.map((option) {
      return SwipeItem(
        content: option,
        likeAction: () => accepted.add(option),
        nopeAction: () => rejected.add(option),
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
            colors: [Color(0xFF47EA99), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Swipe to Pick!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SwipeCards(
                    matchEngine: _matchEngine,
                    itemBuilder: (BuildContext context, int index) {
                      final option = options[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [Colors.white, Color(0xFFF3F3F3)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(32),
                        child: Center(
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    onStackFinished: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DecisionScreen(
                            accepted: accepted,
                            rejected: rejected,
                          ),
                        ),
                      );
                    },
                    itemChanged: (SwipeItem item, int index) {},
                    upSwipeAllowed: false,
                    fillSpace: true,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '${accepted.length + rejected.length} / ${options.length} choices swiped',
                  style: const TextStyle(
                    color: picklLightGreen,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
