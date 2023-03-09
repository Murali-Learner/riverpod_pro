import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pro/model/reel_model.dart';
import 'package:riverpod_pro/providers/reel_provider.dart';
import 'package:riverpod_pro/views/home/widgets/animated_play_button.dart';
import 'package:riverpod_pro/views/home/widgets/like_button_widget.dart';
import 'package:riverpod_pro/views/home/widgets/play_pause_widget.dart';
import 'package:riverpod_pro/views/home/widgets/video_info.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends ConsumerStatefulWidget {
  final ReelVideo video;

  @override
  VideoPlayState createState() => VideoPlayState();

  const VideoPlay({
    Key? key,
    required this.video,
  }) : super(key: key);
}

class VideoPlayState extends ConsumerState<VideoPlay> {
  late VideoPlayerController controller;
  late Future<void> futureController;

  initVideo() {
    controller = VideoPlayerController.network(widget.video.url)
      ..initialize().then((value) {
        return controller.play();
      });
    controller.setLooping(true);

    futureController = controller.initialize();
  }

  @override
  void initState() {
    ref.refresh(showButtonProvider);
    ref.refresh(showDescriptionProvider);
    ref.refresh(isLikeProvider);
    ref.refresh(isPlayProvider);
    ref.refresh(showDescriptionProvider);
    initVideo();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      isPlayProvider,
      (previous, next) {
        log('message: $previous ::next $next');
        {
          if (!next) {
            controller.play();
          } else {
            controller.pause();
          }
        }
      },
    );

    double pageHeight = MediaQuery.of(context).size.height;

    final bool showButton = ref.watch(showButtonProvider);
    final bool showDescription = ref.watch(showDescriptionProvider);

    double pageWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: futureController,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return Container(
            foregroundDecoration: !showDescription
                ? null
                : const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black26],
                        stops: [0, 1],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                  ),
            height: pageHeight,
            width: pageWidth,
            child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: Stack(children: [
                  Positioned.fill(
                      child: GestureDetector(
                          onTap: () {
                            onVideoTap();
                          },
                          child: VideoPlayer(controller))),
                  AnimatedPlayButton(
                      showButton: showButton, controller: controller),
                  Description(
                      description: widget.video.description,
                      isLiked: widget.video.isLiked,
                      likeCount: widget.video.likeCount),
                ])),
          );
        }
      },
    );
  }

  void onVideoTap() {
    ref.read(showDescriptionProvider.notifier).state = false;
    ref.read(showButtonProvider.notifier).state =
        !ref.read(showButtonProvider.notifier).state;
    ref.read(isPlayProvider.notifier).state =
        !ref.read(isPlayProvider.notifier).state;
  }
}
