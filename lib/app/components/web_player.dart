import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPlayer extends StatefulWidget {
  const WebPlayer({super.key, required this.id});
  final String id;
  @override
  State<WebPlayer> createState() => _WebPlayerState();
}

class _WebPlayerState extends State<WebPlayer> {
  late var controller = WebViewController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            log("STARTED PAGE");
         
          },
          onPageFinished: (String url) {
            log("ENDED PAGE");
          
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://player.vimeo.com/video/${widget.id}?autoplay=1&cc_load_policy=1'));

  
  }


  @override
  Widget build(BuildContext context) {
   
    return WebViewWidget(
            controller: controller,
          );
  }
}
