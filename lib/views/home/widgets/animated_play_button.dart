import 'package:flutter/material.dart';
import 'package:riverpod_pro/views/home/widgets/play_pause_widget.dart';
import 'package:video_player/video_player.dart';

class AnimatedPlayButton extends StatelessWidget {
  const AnimatedPlayButton({
    Key? key,
    required this.showButton,
    required this.controller,
  }) : super(key: key);

  final bool showButton;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        child: showButton
            ? Center(
                child: PlayPauseButton(controller: controller),
              )
            : const SizedBox.shrink());
  }
}
