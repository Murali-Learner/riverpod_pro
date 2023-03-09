import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_pro/helpers/show_toast.dart';
import 'package:riverpod_pro/providers/reel_provider.dart';
import 'package:riverpod_pro/views/home/widgets/video_play.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late VideoPlayerController _controller;
  late PageController _pageController;
  bool showLoading = false;

  bool isLiked = false;
  bool showDescription = false;
  String url =
      "https://player.vimeo.com/external/387242416.sd.mp4?s=57e2d102f99b0c27b03d4db5fe9ca903b5646d41&profile_id=165&oauth2_token_id=57447761";
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: List.generate(ReelProvider().reelsList.length, (index) {
          return VideoPlay(video: ReelProvider().reelsList[index]);
        }),
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: const [
      //     // Center(
      //     //   child: IconButton(
      //     //     onPressed: () async {
      //     //       await signInWithGoogle();
      //     //     },
      //     //     icon: const Icon(Icons.login),
      //     //   ),
      //     // ),

      //   ],
      // ),
    );
  }
}
