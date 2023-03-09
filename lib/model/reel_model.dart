class ReelVideo {
  ReelVideo({
    required this.reelId,
    required this.url,
    required this.description,
    required this.isLiked,
    required this.likeCount,
  });

  String reelId;
  String url;
  String description;
  bool isLiked;
  int likeCount;
}
