import 'package:flutter/material.dart';

import '../widgets/review_card.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("베스트 리뷰어"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/Top_Banner.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "UserName",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_events, color: Colors.amber, size: 18),
                      SizedBox(width: 5),
                      Text("1", style: TextStyle(color: Colors.amber)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text("dummy description",
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),

            const Divider(),

            // Review Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("작성한 리뷰 총 35개",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    value: "최신순",
                    items: ["최신순", "인기순"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            const ReviewCard(),
          ],
        ),
      ),
    );
  }
}
