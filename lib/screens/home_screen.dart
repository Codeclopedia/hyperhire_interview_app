import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hyperhire_interview_app/widgets/footer_widget.dart';
import '../provider/user_provider.dart';
import '../widgets/review_item_list.dart';
import 'profile_detail_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSansKR',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final List<Widget> _tabPages = [
      const HomeTab(),
      const Center(child: Text('카테고리')),
      const Center(child: Text('찜')),
      const Center(child: Text('마이페이지')),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Logo')),
      body: _tabPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) =>
            ref.read(selectedIndexProvider.notifier).state = index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '카테고리'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBanner = ref.watch(currentBannerProvider);

    final List<String> bannerImages = [
      'assets/Top_Banner.png',
      'assets/Top_Banner.png',
      'assets/Top_Banner.png',
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          // Image Slider
          CarouselSlider(
            items: bannerImages.map((image) {
              return Image.asset(image, fit: BoxFit.cover);
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 1,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                ref.read(currentBannerProvider.notifier).state = index;
              },
            ),
          ),

          // Image Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              bannerImages.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentBanner == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          itemListSection(),
          // Best Reviewers Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '골드 계급 사용자들이에요',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '베스트 리뷰어 🏆 Top10',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileDetailScreen()),
                            );
                          },
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/Top_Banner.png'),
                              ),
                              Text('Name0${index + 1}',
                                  style: const TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FooterSection()
        ],
      ),
    );
  }

  Widget itemListSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Review Ranking Top 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '제일 핫한 리뷰를 만나보세요',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '리뷰 랭킹 ⭐ top 3',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.black,
                    size: 40,
                  ))
            ],
          ),
          const SizedBox(height: 15),
          buildReviewItem('LG전자 스탠바이미', '27ART10AKPL', 4.89, 216, '편리성',
              'assets/Top_Banner.png'),
          buildReviewItem('LG전자 울트라HD', '75UP8300KNA', 4.36, 136, '고화질',
              'assets/Top_Banner.png'),
          buildReviewItem('라익미 스마트', 'DS4001L NETRANGE', 3.98, 98, '가성비',
              'assets/Top_Banner.png'),
        ],
      ),
    );
  }
}
