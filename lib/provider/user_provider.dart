import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

final userProvider = Provider<User>((ref) {
  return User(
    name: "John Doe",
    profileImage:
        "http://www.listercarterhomes.com/wp-content/uploads/2013/11/dummy-image-square.jpg",
  );
});

// State Providers
final selectedIndexProvider = StateProvider<int>((ref) => 0);
final currentBannerProvider = StateProvider<int>((ref) => 0);
