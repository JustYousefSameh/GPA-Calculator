import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_calculator/core/constants/constants.dart';
import 'package:gpa_calculator/features/auth/controller/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
    Routemaster.of(context).replace('/');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      label: Text(
        'Countinue with Google',
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: () => signInWithGoogle(context, ref),
      icon: Image.asset(
        Constants.googlePath,
        width: 35,
      ),
    );
  }
}
