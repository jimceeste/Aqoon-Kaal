import 'package:aqoon_bile/app/modules/user/views/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../generated/locales.g.dart';
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
              'Aqoon Kaab',
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
                      // CustomTextField(
                      //   textInputType: TextInputType.phone,
                      //   hintText: "2526XXXXXXXX",
                      //   icon: IconlyLight.call,
                      //   controller: controller.username,
                      //   textCapitalization: TextCapitalization.words,
                      //   textInputAction: TextInputAction.next,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Username is required'.tr;
                      //     }
                      //     return null;
                      //   },
                      // ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          //color: Get.theme.cardColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: InternationalPhoneNumberInput(
                          textFieldController: cont.uText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Number is required'.tr;
                            }
                            return null;
                          },
                          onInputChanged: (PhoneNumber number) {
                            cont.usernameValue.value = number.phoneNumber.toString();
                          },
                          inputDecoration: const InputDecoration(
                              // border: InputBorder.none,
                              hintText: 'Your Number',
                              hintStyle: TextStyle(fontSize: 12.0)),
                          onInputValidated: (bool value) {},
                          selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              leadingPadding: 8.0,
                              trailingSpace: false,
                              setSelectorButtonAsPrefixIcon: true),
                          ignoreBlank: true,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              TextStyle(color: Get.theme.hoverColor),
                          initialValue: cont.number,
                          formatInput: true,
                          maxLength: 10,
                          scrollPadding: const EdgeInsets.all(8.0),
                          spaceBetweenSelectorAndTextField: 0,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {},
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        hintText: LocaleKeys.password.tr,
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
                              child: Text(
                                LocaleKeys.forgot_password.tr,
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
                          child: Text(
                            LocaleKeys.login.tr,
                          ),
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
                Text(
                  LocaleKeys.dont_have_an_account.tr,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const RegisterView());
                  },
                  child: Text(
                    LocaleKeys.sign_up.tr,
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
