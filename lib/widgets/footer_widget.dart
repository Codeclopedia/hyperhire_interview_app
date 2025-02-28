import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Light grey background
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Company Name
          const Text(
            "LOGO Inc.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 10),

          // Links Row
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16, // Space between items
            children: [
              _footerLink("회사 소개"),
              _footerLink("인재 채용"),
              _footerLink("기술 블로그"),
              _footerLink("리뷰 저작권"),
            ],
          ),

          const SizedBox(height: 16),

          // Email and Language Dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email, color: Colors.grey),
              const SizedBox(width: 8),
              const Text("review@logo.com",
                  style: TextStyle(color: Colors.black87)),
              const SizedBox(width: 16),
              _languageDropdown(),
            ],
          ),

          const SizedBox(height: 16),

          // Copyright Info
          const Text(
            "@2022-2022 LOGO Lab, Inc. (주)아무개 서울시 강남구",
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Footer Link Text Widget
  Widget _footerLink(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),
    );
  }

  // Language Dropdown Button
  Widget _languageDropdown() {
    return DropdownButton<String>(
      value: "KOR",
      underline: const SizedBox(), // Removes default underline
      onChanged: (String? newValue) {},
      items: ["KOR", "ENG"]
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
    );
  }
}
