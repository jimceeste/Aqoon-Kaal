import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../generated/locales.g.dart';
import '../../../components/custom_textfeild.dart';
import '../../../constants.dart';

class RegisterView extends GetView<UserController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (cont) {
      return ModalProgressHUD(
        inAsyncCall: cont.isRegisterLoading,
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
            title:  Text(
             LocaleKeys.register.tr,
              style:
                  const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          body: Form(
            key: cont.formKey,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        alignment: Alignment.center,
                        child: Text(
                          LocaleKeys.please_enter_your.tr,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // CustomTextField(
                      //   hintText: "Name",
                      //   icon: IconlyLight.profile,
                      //   controller: controller.name,
                      //   textCapitalization: TextCapitalization.words,
                      //   textInputAction: TextInputAction.next,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Name is required'.tr;
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          //color: Get.theme.cardColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: InternationalPhoneNumberInput(
                          textFieldController: cont.rText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Number is required'.tr;
                            }
                            return null;
                          },
                          onInputChanged: (PhoneNumber number) {
                            cont.rUsernameValue.value =
                                number.phoneNumber.toString();
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
                      // CustomTextField(
                      //   hintText: "2526XXXXXXXX",
                      //   icon: IconlyLight.call,
                      //   controller: controller.phone,
                      //   textCapitalization: TextCapitalization.words,
                      //   textInputAction: TextInputAction.next,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Number is required'.tr;
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        hintText: LocaleKeys.password.tr,
                        isobscureText: cont.isVisiblePassword,
                        icon: IconlyLight.lock,
                        controller: controller.password,
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
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        hintText: LocaleKeys.confirm_password.tr,
                        icon: IconlyLight.lock,
                        isobscureText: cont.isVisiblePassword,
                        controller: controller.confirmPassword,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm is required'.tr;
                          }
                          return null;
                        },
                        sufixIcon: cont.isVisiblePassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        onSufixIconPressed: () => cont.togglePasswordVisible(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(left: 30, right: 30),
                      //   padding: const EdgeInsets.all(5.0),
                      //   decoration: BoxDecoration(
                      //     //color: Get.theme.cardColor,
                      //     borderRadius: BorderRadius.circular(12.0),
                      //   ),
                      //   child: InternationalPhoneNumberInput(
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return 'Number is required'.tr;
                      //       }
                      //       return null;
                      //     },
                      //     onInputChanged: (PhoneNumber number) {},
                      //     inputDecoration: const InputDecoration(
                      //         // border: InputBorder.none,
                      //         hintText: "6XXXXXXXX",
                      //         hintStyle: TextStyle(fontSize: 12.0)),
                      //     onInputValidated: (bool value) {},
                      //     selectorConfig: const SelectorConfig(
                      //         selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      //         leadingPadding: 8.0,
                      //         trailingSpace: false,
                      //         setSelectorButtonAsPrefixIcon: true),
                      //     ignoreBlank: true,
                      //     autoValidateMode: AutovalidateMode.disabled,
                      //     selectorTextStyle:
                      //         TextStyle(color: Get.theme.hoverColor),
                      //     initialValue: controller.initialNumber,
                      //     textFieldController: controller.phone,
                      //     formatInput: true,
                      //     maxLength: 10,
                      //     scrollPadding: const EdgeInsets.all(8.0),
                      //     spaceBetweenSelectorAndTextField: 0,
                      //     keyboardType: const TextInputType.numberWithOptions(
                      //         signed: true, decimal: true),
                      //     inputBorder: const OutlineInputBorder(),
                      //     onSaved: (PhoneNumber number) {},
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 25,
                      // ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => cont.register(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            LocaleKeys.sign_up.tr,
                          ),
                        ),
                      )
                    ],
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
