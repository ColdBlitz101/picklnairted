import 'package:flutter/material.dart';
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

  static const Color picklGreen = Color(0xFF6ABF4B);

  @override
  void initState() {
    super.initState();

    List<SwipeItem> swipeItems = options.map((option) {
      return SwipeItem(
        content: option,
        likeAction: () {
          accepted.add(option);
          print('Accepted: $option');
        },
        nopeAction: () {
          rejected.add(option);
          print('Rejected: $option');
        },
        superlikeAction: () {
          // Optional: not used here
        },
      );
    }).toList();

    _matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: picklGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              const Text(
                'Swipe to Pick!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    final option = options[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      elevation: 8,
                      child: Center(
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
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
                          'All done!\nAccepted: ${accepted.join(", ")}\nRejected: ${rejected.join(", ")}',
                        ),
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  },
                  itemChanged: (SwipeItem item, int index) {
                    // Optional: do something on each card change
                  },
                  upSwipeAllowed: false,
                  fillSpace: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
