// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_pro/helpers/show_toast.dart';
import 'package:riverpod_pro/providers/reel_provider.dart';
import 'package:riverpod_pro/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  onGoogleSignInPressed(ref, context) async {
    ref.read(showLoadingProvider.notifier).state = true;
    await signInWithGoogle();
    ref.read(showLoadingProvider.notifier).state = false;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String email = _prefs.getString("email").toString();
    if (email.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        ),
      );
    } else {
      ref.read(showLoadingProvider.notifier).state = false;
      showToast("Oops! Something went wrong\nTry again..");
    }
  }

  Future<void> signInWithGoogle() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await (_googleSignIn.signIn()) as GoogleSignInAccount;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      log(userCredential.credential.toString());

      showToast(googleSignInAccount.email);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', googleSignInAccount.email.toString());
      prefs.setString(
          'accessToken', userCredential.credential!.accessToken.toString());
    } catch (e) {
      log(e.toString());
      showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPlaying = ref.watch(showLoadingProvider);

    return Scaffold(
      body: Center(
        child: ref.read(showLoadingProvider.notifier).state
            ? const CircularProgressIndicator.adaptive()
            : InkWell(
                onTap: () async {
                  await onGoogleSignInPressed(ref, context);
                },
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/google_image.png',
                        height: 25.0,
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
