import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpa_calculator/features/auth/controller/auth_controller.dart';

import '../../../core/constants/constants.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipOval(
              child: user!.profilePic == ''
                  ? Image.asset(
                      Constants.defaultAvatarPath,
                      width: 190,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      user.profilePic.replaceAll('s96-c', 's250-c'),
                      width: 190,
                      fit: BoxFit.fill,
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              onPressed: () =>
                  ref.watch(authControllerProvider.notifier).logout(),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
