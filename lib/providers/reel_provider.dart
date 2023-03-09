import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pro/model/reel_model.dart';

class ReelProvider {
  List<ReelVideo> reelsList = [
    ReelVideo(
        reelId: '1',
        url:
            'https://player.vimeo.com/external/352012062.sd.mp4?s=5bad7de0866856c767206de312bd158f9d9813ab&profile_id=164&oauth2_token_id=57447761',
        description:
            'Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain\'t no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org',
        isLiked: true,
        likeCount: 125342),
    ReelVideo(
        reelId: '2',
        url:
            'https://player.vimeo.com/external/357646800.sd.mp4?s=e3e66dd3ca57f56c49a2c37712634d827f516235&profile_id=164&oauth2_token_id=57447761',
        description:
            "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For \$35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
        isLiked: true,
        likeCount: 12),
    ReelVideo(
        reelId: '3',
        url:
            'https://player.vimeo.com/external/333757267.sd.mp4?s=8dc7f65de267d6d903d28709f8c8b5e52abc84c5&profile_id=164&oauth2_token_id=57447761',
        description:
            "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
        isLiked: true,
        likeCount: 18342),
    ReelVideo(
        reelId: '4',
        url:
            'https://player.vimeo.com/external/332871723.sd.mp4?s=b5508f4bb0d446e1a25cb53a3364be565b657237&profile_id=164&oauth2_token_id=57447761',
        description:
            "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For \$35.  Find out more at google.com/chromecast.",
        isLiked: true,
        likeCount: 12),
    ReelVideo(
        reelId: '5',
        url:
            'https://player.vimeo.com/external/403570399.sd.mp4?s=aa2e5afc0dcbf6d8755173c3ee9437d9e16859a0&profile_id=164&oauth2_token_id=57447761',
        description:
            "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For \$35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.",
        isLiked: true,
        likeCount: 12),
  ];
}

final isLikeProvider = StateProvider((_) => false);
final isPlayProvider = StateProvider((_) => false);
final showButtonProvider = StateProvider.autoDispose((ref) => false);
final showDescriptionProvider = StateProvider.autoDispose((ref) => false);
final likeCountProvider = StateProvider((_) => 0);
final showLoadingProvider = StateProvider((_) => false);
