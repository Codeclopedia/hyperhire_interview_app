import 'package:flutter/material.dart';
import '../screens/profile_detail_screen.dart';

class ReviewList extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      "name": "Name01",
      "profileImage": "https://via.placeholder.com/150",
      "ranking": "골드",
      "description": "조립컴 업체를 운영하며 리뷰를 작성합니다.",
    },
    {
      "name": "User02",
      "profileImage": "https://via.placeholder.com/150",
      "ranking": "실버",
      "description": "게임 리뷰를 주로 작성합니다.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: users.map((user) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user["profileImage"]),
          ),
          title: Text(user["name"]),
          subtitle: const Text("Top Reviewer"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileDetailScreen(),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
