import 'package:flutter/material.dart';

class DecisionScreen extends StatelessWidget {
  final List<String> pickedItems;
  const DecisionScreen({super.key, required this.pickedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decision Result')),
      body: pickedItems.isEmpty
          ? const Center(
              child: Text(
                'No items were picked.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: pickedItems.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text('${index + 1}'),
                  ),
                  title: Text(
                    pickedItems[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
    );
  }
}
