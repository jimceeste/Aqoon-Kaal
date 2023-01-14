import 'package:aqoon_bile/app/modules/about/controllers/about_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../../constants.dart';
import 'about_view.dart';
class AboutAqoonKaab extends StatelessWidget {
   AboutAqoonKaab({super.key});
final controller=Get.find<AboutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                kPrimaryLightColor.withOpacity(0.85), BlendMode.darken),
            image: const AssetImage('assets/images/background7.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                       width: 200,
                       height: 100,
                      image: AssetImage('assets/images/tgr.png'),
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Aqoon",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0, 
                          ),
                        ),
                        Text(
                          " Kaab",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Center(
                        child: Text(
                      'Aqoonkaab education platform',
                      style: GoogleFonts.pacifico(
                          color: Colors.white, letterSpacing: 0.3),
                    )),
                    // FutureBuilder<PackageInfo>(
                    //   future: PackageInfo.fromPlatform(),
                    //   builder: (context, snapshot) {
                    //     switch (snapshot.connectionState) {
                    //       case ConnectionState.done:
                    //         return Center(
                    //             child: Text(
                    //           'Version: ${snapshot.data!.version}',
                    //           style: TextStyle(color: Colors.white),
                    //         ));
                    //       default:
                    //         return const SizedBox();
                    //     }
                    //   },
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: const [
                          Text(
                            '''Aqoonkaab education platform waa xarun wax barasho fogaan darsi ah oo loo aas-aasay, si loo kaafiyo baahiyaha ardayda soomaaliyeed, waxbarashadana loo baahiyo heerkasta. Aqoonkaan education platform waxaa lafuray 7-8-2022. Waxaana laga furey deg.Hodanwadaag, xaafada Balagsii.
                            ''',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              wordSpacing: 1.2,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LaunchButton(
                          iconData: Icons.call,
                          onPressed: () {
                            controller.callPhone('tel:0619779677');
                          },
                        ),
                        LaunchButton(
                          iconData: Icons.language,
                          onPressed: () {
                            controller.launchWebsite('https://www.aqoonkaab.so/');
                          },
                        ),
                        LaunchButton(
                          iconData: LineIcons.whatSApp,
                          onPressed: () {
                            controller.launchWhatsApp('252619779677');
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                      child: Material(
                        color: Get.isDarkMode ? Get.theme.primaryColor : null,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                                child: Text(
                              'Go Back to App',
                              style: TextStyle(
                                color: kPrimaryLightColor,
                                fontSize: 16,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}