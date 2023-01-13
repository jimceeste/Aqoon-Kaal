import 'dart:developer';

import 'package:aqoon_bile/app/constants.dart';
import 'package:aqoon_bile/app/data/models/user_model.dart';
import 'package:aqoon_bile/app/modules/user/providers/user_provider.dart';
import 'package:aqoon_bile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class UserController extends GetxController {
  UserController() {
    getUser();
  }
  UserModel user = UserModel();
  PhoneNumber number = PhoneNumber(isoCode: 'SO');
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();
  final lFormKey = GlobalKey<FormState>();
  bool get hasData => box.hasData(kUserInfo);
  bool isVisiblePassword = false;
  bool isRegisterLoading = false;
  bool isLoginLoading = false;

  // Login TextFields
  TextEditingController username = TextEditingController();
  TextEditingController lPassword = TextEditingController();
  var usernameValue = ''.obs;
  var uText = TextEditingController();

  // Registration TexFields
  //TextEditingController name = TextEditingController();
  //TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var rUsernameValue = ''.obs;
  var rText = TextEditingController();

  PhoneNumber initialNumber = PhoneNumber(isoCode: 'SO');

  togglePasswordVisible() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  login() async {
    if (lFormKey.currentState?.validate() ?? false) {
      try {
        Get.focusScope?.unfocus();
        setLoginLoading();
        String phone = usernameValue.value.substring(1);
        user = await UserProvider()
            .login(password: lPassword.text, username: phone);
        update();
        Get.offNamed(Routes.HOME);
      } catch (e) {
        log(e.toString(), name: "Login Error");
        erroMessage(e.toString());
      }
      setLoginLoading();
    }
  }

  setRegisterLoading() {
    isRegisterLoading = !isRegisterLoading;
    update();
  }

  setLoginLoading() {
    isLoginLoading = !isLoginLoading;
    update();
  }

  register() async {
    if (formKey.currentState?.validate() ?? false) {
      // String name = this.name.text;
      // String email = this.email.text;
      String phone = rUsernameValue.value.substring(1);
      String password = this.password.text;
      String confirm = confirmPassword.text;
      if (password.length >= 6) {
        if (password == confirm) {
          try {
            Get.focusScope?.unfocus();
            setRegisterLoading();
            user = await UserProvider()
                .createUser(password: password, phone: phone);
            update();
            Get.offNamed(Routes.HOME);
          } catch (e) {
            log(e.toString(), name: "Register Error");
            erroMessage(e.toString());
          }
          setRegisterLoading();
        } else {
          erroMessage("The two password must mutch each other");
        }
      } else {
        erroMessage("Password Length must not less than 6 Digits");
      }
    }
  }

  getUser() {
    try {
      if (box.hasData(kUserInfo)) {
        print("HAS DATA: ${true}");
        final json = box.read(kUserInfo);
        if (json != null) {
          user = UserModel.fromJson(json);
          update();
        }
      } else {
        print("NO DATA");
      }
    } catch (e) {
      log(e.toString(), name: "Get User Error");
    }
  }

  checkToken() async {
    try {
      if (box.hasData(kUserInfo) && user.dDoc != null) {
        var data = await UserProvider().checkToken();

        if (data["user"]["token"] == user.token) {
          log("SAME");
          user.dDoc?.bundles?.clear();
          print("BEFORE ${user.dDoc?.bundles}");
          for (var element in data["user"]["bundles"]) {
            user.dDoc?.bundles?.add(element);
          }
          update();
          print("AFTER ${user.dDoc?.bundles}");
        } else {
          logout();
          update();
          Get.snackbar(
            'Oops!',
            'You are logged out! Someone else has currently logged in using the same username.',
            backgroundColor: Colors.red[300],
            colorText: Colors.white,
          );
          log("not same");
        }
        print(data);
      }
    } catch (e) {
      log(e.toString(), name: "Check token error");
    }
  }

  logout() {
    box.remove(kUserInfo);
    //Get.offAllNamed(Routes.USER);
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getUser();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

}
