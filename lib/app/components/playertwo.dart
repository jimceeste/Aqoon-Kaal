import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
class PlayerTwo extends StatefulWidget {
  const PlayerTwo({super.key, required this.id});
final String id;
  @override
  State<PlayerTwo> createState() => _PlayerTwoState();
}

class _PlayerTwoState extends State<PlayerTwo> {
  final String _vimeoVideoUrl = 'https://vimeo.com/70591644';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: VimeoVideoPlayer(
          vimeoPlayerModel: VimeoPlayerModel(
            url: "https://vimeo.com/${widget.id}",
            systemUiOverlay: const [
              SystemUiOverlay.top,
              SystemUiOverlay.bottom,
            ],
          ),
        ),
      );
  }
}