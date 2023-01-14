import 'dart:developer';

import 'package:aqoon_bile/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FramPlayer extends StatefulWidget {
  const FramPlayer({super.key, required this.id});
  final String id;
  @override
  State<FramPlayer> createState() => _FramPlayerState();
}

class _FramPlayerState extends State<FramPlayer> {
  @override
  Widget build(BuildContext context) {
    log("THE ID IS: ${widget.id}");
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: HtmlWidget(
        '''  <div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/${widget.id}?h=09ae9b648b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;" title="ARABIC EXAM 2020-2021.mp4"></iframe></div> ''',
        onLoadingBuilder: (context, element, loadingProgress) =>
            Center(
              child: CircularProgressIndicator(
          value: loadingProgress,
          color: kPrimaryColor,

        ),
            ),
        onErrorBuilder: (context, element, error) => const Center(child: Text("OOPS SOMTHING WENT WRONG")),
       // renderMode: RenderMode.sliverList,
       
      ),
    );
  }
}
