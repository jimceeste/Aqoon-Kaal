// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// class FramPlayer extends StatefulWidget {
//   const FramPlayer({super.key, required this.id});
//   final String id;
//   @override
//   State<FramPlayer> createState() => _FramPlayerState();
// }

// class _FramPlayerState extends State<FramPlayer> {
//   @override
//   Widget build(BuildContext context) {
//     log("THE ID IS: ${widget.id}");
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: HtmlWidget(
//         '''  <iframe src="https://player.vimeo.com/video/${widget.id}?h=09ae9b648b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479?autoplay=1&rel=0" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>''',

//         onLoadingBuilder: (context, element, loadingProgress) => Center(
//           child: AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Container(
//               alignment: Alignment.center,
//               color: Colors.black,
//               child: CircularProgressIndicator(
//                 value: loadingProgress,
//                 color: Colors.white,
//                 strokeWidth: 3.0,
//               ),
//             ),
//           ),
//         ),
//         onErrorBuilder: (context, element, error) =>
//             const Center(child: Text("OOPS SOMTHING WENT WRONG")),
//         buildAsync: true,
//         // customWidgetBuilder: (element) => AspectRatio(
//         //   aspectRatio: 16 / 9,
//         //   child: Container(
//         //     color: Colors.black,
//         //     child: const Center(
//         //       child: CircularProgressIndicator(

//         //         color: Colors.white,
//         //         strokeWidth:3.0 ,
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // renderMode: RenderMode.sliverList,
//       ),
//     );
//   }
// }
