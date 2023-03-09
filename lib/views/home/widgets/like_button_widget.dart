import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pro/providers/reel_provider.dart';

class LikeButton extends ConsumerStatefulWidget {
  int likeCount;
  bool isLiked;
  LikeButton({
    Key? key,
    required this.likeCount,
    required this.isLiked,
  }) : super(key: key);

  @override
  ConsumerState<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends ConsumerState<LikeButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLiked = ref.watch(isLikeProvider);

    return Column(
      children: [
        IconButton(
          onPressed: () {
            ref.read(isLikeProvider.notifier).state =
                !ref.read(isLikeProvider.notifier).state;
            // if (!ref.read(isLikeProvider.notifier).state) {
            //   ref.read(likeCountProvider.notifier).state++;
            // }
          },
          icon: Icon(
            size: 30,
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.white,
          ),
          padding: EdgeInsets.zero,
        ),
        // Text(
        //   NumberFormat.compact().format(likeCount),
        //   style: const TextStyle(
        //     overflow: TextOverflow.ellipsis,
        //     color: Colors.white,
        //     fontSize: 12,
        //   ),
        // ),
      ],
    );
  }
}
