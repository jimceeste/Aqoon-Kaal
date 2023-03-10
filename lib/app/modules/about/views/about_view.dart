import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../../constants.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
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
                      image: AssetImage('assets/images/jtech.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "JTech",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          " Solutions",
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
                      'Making your business flourish',
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
                            '''Jamhuriya Technology Solutions - JTech is a professional technology solution service provider and ICT training center founded in 2020 by Jamhuriya University of Science and Technology in Mogadishu, Somalia. JTech has been established to fill the gap (of quality and creativity) in the field of ICT solutions in our nation and beyond by transforming clients??? business, operating and technology models for the digital era, and offering professional hands-on training to empower individuals and organizations in solving and innovating new ideas.
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
                            controller.callPhone('tel:0615868999');
                          },
                        ),
                        LaunchButton(
                          iconData: Icons.language,
                          onPressed: () {
                            controller.launchWebsite('https://jtech.so/');
                          },
                        ),
                        LaunchButton(
                          iconData: LineIcons.whatSApp,
                          onPressed: () {
                            controller.launchWhatsApp('252615868999');
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
class LaunchButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final Color? backgroundColor;

  const LaunchButton(
      {required this.onPressed, required this.iconData, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: backgroundColor == null
                ? Get.theme.primaryColor
                : backgroundColor!,
            blurRadius: 5.0,
          )
        ],
      ),
      child: IconButton(
        icon: Icon(iconData, color: Colors.white, size: 22),
        onPressed: onPressed,
      ),
    );
  }
}
