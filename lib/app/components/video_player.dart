import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final PodPlayerController controller;
  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(
        widget.id,
      ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
print("THE IDPASSED IS: ${widget.id}");
    return PodVideoPlayer(
      // onVideoError: () {
      //   return const AspectRatio(
      //     aspectRatio: 16 / 9,
      //     child: Center(
      //       child: Text(
      //         'oops!, please check your Internet',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ),
      //   );
      // },
      controller: controller,
      videoAspectRatio: 16 / 9,
      podProgressBarConfig: const PodProgressBarConfig(
        playingBarColor: kPrimaryColor,
        circleHandlerColor: kSecondaryLightColor,
      ),
    );
  }
}
