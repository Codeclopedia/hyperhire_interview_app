import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Title
            const Text("AMD 라이젠 5 5600X 버미어 정품 멀티팩",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star_border, color: Colors.amber, size: 18),
                SizedBox(width: 5),
                Text("4.07", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),

            // Reviewer Info
            const Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/68/28/4c/68284c53b5f4d7d94cd40fa19c9fd21d.jpg"),
                ),
                SizedBox(width: 10),
                Text("Name01", style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text("2022.12.09", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),

            // Review Content
            const Text(
              "⚡ 멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.\n\n"
              "⚡ 3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌까진 아닙니다.",
              style: TextStyle(color: Colors.black87),
            ),

            const SizedBox(height: 10),

            // Review Images
            Row(
              children: [
                reviewImage(
                    "https://i.pinimg.com/736x/68/28/4c/68284c53b5f4d7d94cd40fa19c9fd21d.jpg"),
                const SizedBox(width: 5),
                reviewImage(
                    "https://i.pinimg.com/736x/68/28/4c/68284c53b5f4d7d94cd40fa19c9fd21d.jpg"),
                const SizedBox(width: 5),
                reviewImage(
                    "https://i.pinimg.com/736x/68/28/4c/68284c53b5f4d7d94cd40fa19c9fd21d.jpg"),
                const SizedBox(width: 5),
                reviewImage(
                    "https://i.pinimg.com/736x/68/28/4c/68284c53b5f4d7d94cd40fa19c9fd21d.jpg"),
              ],
            ),

            const SizedBox(height: 10),
            const Divider(),
            const Text("💬 댓글 달기...", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget reviewImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(url, width: 70, height: 70, fit: BoxFit.cover),
    );
  }
}
