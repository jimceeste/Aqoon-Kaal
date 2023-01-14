import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants.dart';
import '../controllers/home_controller.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   late WebViewController controller;
//   bool isDeviceConnected = false;
//   bool isStarted = false;
//   @override
//   void initState() {
//     super.initState();
//     Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) async {
//       //if (result != ConnectivityResult.none) {
//       isDeviceConnected = await InternetConnectionChecker().hasConnection;
//       setState(() {});
//       //}
//     });
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
          
//           onPageStarted: (String url) {
//             log("STARTED");
//             isStarted = true;
//             setState(() {});
//           },
//           onPageFinished: (String url) {
//             log("FINISHED");
//             isStarted = false;
//             setState(() {});
//           },
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://www.aqoonkaab.so/'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (await controller.canGoBack()) {
//           controller.goBack();
//         } else {
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               content: const Text("Are you sure want to exit?"),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     if (Platform.isAndroid) {
//                       SystemNavigator.pop();
//                     } else if (Platform.isIOS) {
//                       exit(0);
//                     }
//                   },
//                   child: const Text("Yes"),
//                 ),
//                 TextButton(
//                   onPressed: () => Get.back(),
//                   child: const Text("No"),
//                 ),
//               ],
//             ),
//           );
//         }

//         return false;
//       },
//       child: ConnectivityWidgetWrapper(
//         child: Scaffold(
//           //appBar: AppBar(title: const Text("Home")),
//           body:  SafeArea(child: WebViewWidget(controller: controller)),
//         ),
//       ),
//     );
//   }
// }
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (main) {
        return WillPopScope(
          onWillPop: ()=>main.exit(main.index),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                //this color must be equal to the WaterDropNavBar backgroundColor
                //statusBarColor:Get.theme.scaffoldBackgroundColor ,
                systemNavigationBarColor: Get.theme.cardColor,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            child: Scaffold(
              body: GetBuilder<HomeController>(
                  builder: (cont) => cont.screens[cont.index]),
              bottomNavigationBar: GetBuilder<HomeController>(
                builder: (cont) {
                  return WaterDropNavBar(
                    iconSize: 24,
                    bottomPadding: 8,
                    
                    backgroundColor: Theme.of(context).cardColor,
                    selectedIndex: cont.index,
                    onItemSelected:cont.updateIndex,
                    inactiveIconColor: kPrimaryColor,
                    waterDropColor: kPrimaryColor,
                    barItems: [
                      BarItem(
                        filledIcon: IconlyBold.home,
                        outlinedIcon: IconlyLight.home,
                      ),
                      BarItem(
                        filledIcon: IconlyBold.search,
                        outlinedIcon: IconlyLight.search,
                      ),
                      BarItem(
                        filledIcon: IconlyBold.discovery,
                        outlinedIcon: IconlyLight.discovery,
                      ),
                      BarItem(
                        filledIcon: IconlyBold.profile,
                        outlinedIcon: IconlyLight.profile,
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        );
      }
    );
  }
}
