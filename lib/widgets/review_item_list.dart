import 'package:flutter/material.dart';

Widget buildReviewItem(
  String title,
  String model,
  double rating,
  int count,
  String category,
  String imagePath,
) {
  return Card(
    margin: const EdgeInsets.only(bottom: 15),
    child: ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model, style: const TextStyle(color: Colors.grey)),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              Text(' $rating ($count)'),
              const SizedBox(width: 10),
              Text(category, style: const TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    ),
  );
}
