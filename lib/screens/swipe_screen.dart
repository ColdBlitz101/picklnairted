import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

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

  static const Color picklGreen = Color(0xFF6ABF4B);

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
                child: Swiper(
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      elevation: 8,
                      child: Center(
                        child: Text(
                          options[index],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                  layout: SwiperLayout.STACK,
                  itemWidth: MediaQuery.of(context).size.width * 0.85,
                  itemHeight: MediaQuery.of(context).size.height * 0.6,
                  onIndexChanged: (index) {
                    if (index == options.length - 1) {
                      // Done swiping
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You’ve swiped all picks!')),
                      );
                    }
                  },
                  onTap: (index) {
                    print('Tapped on: ${options[index]}');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
