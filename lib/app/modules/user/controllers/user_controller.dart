import 'dart:developer';

import 'package:aqoon_bile/app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class UserController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController lPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  PhoneNumber initialNumber = PhoneNumber(isoCode: 'SO');
  final box=GetStorage();
  final formKey = GlobalKey<FormState>();
  final lFormKey = GlobalKey<FormState>();
  bool get hasData => box.hasData(kUserInfo) && box.hasData(currentToken);
  bool isVisiblePassword = false;
  bool isRegisterLoading=false;
  bool isLoginLoading=false;

  togglePasswordVisible() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  login() {
    if(lFormKey.currentState?.validate()??false){
      if(lPassword.text.length <6){
        erroMessage("Password Length must not less than 6 Digits");
      }
    }
  }

  register() {
    if (formKey.currentState?.validate() ?? false) {
      String name = this.name.text;
      String email = this.email.text;
      String phone = this.phone.text;
      String password = this.password.text;
      String confirm = confirmPassword.text;
      if (password.length >= 6) {
        if (password == confirm) {
          if (email.isEmail) {
            try {
              
            } catch (e) {
              log(e.toString(), name: "Register Error");
            }
          } else {
            erroMessage("Please enter valid E-mail");
          }
        } else {
          erroMessage("The two password must mutch each other");
        }
      } else {
        erroMessage("Password Length must not less than 6 Digits");
      }
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

}
