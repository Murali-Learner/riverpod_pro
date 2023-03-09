import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pro/providers/reel_provider.dart';
import 'package:video_player/video_player.dart';

class PlayPauseButton extends ConsumerStatefulWidget {
  final VideoPlayerController controller;
  const PlayPauseButton({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends ConsumerState<PlayPauseButton> {
  @override
  Widget build(BuildContext context) {
    final bool isPlaying = ref.watch(isPlayProvider);

    return FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () {
          videoController();
        },
        child:
            Icon(isPlaying ? Icons.pause_outlined : Icons.play_arrow_outlined));
  }

  videoController() {
    ref.read(isPlayProvider.notifier).state =
        !ref.read(isPlayProvider.notifier).state;
    ref.read(showButtonProvider.notifier).state =
        !ref.read(showButtonProvider.notifier).state;

    ref.read(isPlayProvider.notifier).state
        // widget.controller.value.isPlaying
        ? widget.controller.pause()
        : widget.controller.play();
  }
}
