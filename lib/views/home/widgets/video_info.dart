import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pro/providers/reel_provider.dart';
import 'package:riverpod_pro/views/home/widgets/like_button_widget.dart';

class Description extends ConsumerWidget {
  final String description;
  final int likeCount;
  final bool isLiked;
  const Description({
    required this.description,
    required this.likeCount,
    required this.isLiked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showDescription = ref.watch(showDescriptionProvider);
    return Positioned(
      bottom: 10,
      right: 10,
      left: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  ref.read(showDescriptionProvider.notifier).state =
                      !ref.read(showDescriptionProvider.notifier).state;
                },
                child: Text(
                  description,
                  maxLines: showDescription ? null : 3,
                  style: TextStyle(
                    overflow: showDescription
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: LikeButton(
                likeCount: likeCount,
                isLiked: isLiked,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
