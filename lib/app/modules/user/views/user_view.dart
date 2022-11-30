import 'package:aqoon_bile/app/modules/user/views/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../components/custom_textfeild.dart';
import '../../../constants.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (cont) {
      return ModalProgressHUD(
        inAsyncCall: cont.isLoginLoading,
        progressIndicator: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 10),
                    color: Colors.grey.shade200,
                    blurRadius: 12,
                    blurStyle: BlurStyle.normal),
                BoxShadow(
                    offset: const Offset(1, 10),
                    color: Colors.grey.shade300,
                    blurRadius: 12,
                    blurStyle: BlurStyle.normal)
              ]),
          child: const CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 1.6,
          ),
        ),
        blur: 2.5,
        opacity: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                IconlyLight.arrow_left,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Aqoon Bile',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          body: Form(
            key: cont.lFormKey,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        //alignment: Alignment.center,
                        width: 150,
                        height: 100,
                        child: FlutterLogo(),
                        //child: Lottie.asset('assets/images/looking_doctor.json'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        hintText: "Username or E-mail",
                        icon: IconlyLight.profile,
                        controller: controller.username,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        hintText: "Password",
                        isobscureText: cont.isVisiblePassword,
                        icon: IconlyLight.lock,
                        controller: controller.lPassword,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required'.tr;
                          }
                          return null;
                        },
                        sufixIcon: cont.isVisiblePassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        onSufixIconPressed: () => cont.togglePasswordVisible(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => cont.login(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text("Login"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const RegisterView());
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
