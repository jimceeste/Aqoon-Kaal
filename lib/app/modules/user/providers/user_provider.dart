import 'dart:convert';

import 'package:aqoon_bile/app/constants.dart';
import 'package:aqoon_bile/app/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserProvider extends GetConnect {
  final box = GetStorage();
  createUser({required String password, required String phone}) async {
    var response = await http.post(
      Uri.parse("$kEndPoint/register"),
      body: {"phone": phone, "password": password},
    );

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      print(decodedData["user"]);
      await saveUser(UserModel.fromJson(decodedData["user"]));
      return UserModel.fromJson(decodedData["user"]);
    } else {
      throw response.body;
    }
  }

  login({required String username, required String password}) async {
    var response = await http.post(
      Uri.parse("$kEndPoint/login"),
      body: {"phone": username, "password": password},
    );
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      print(decodedData);
      await saveUser(UserModel.fromJson(decodedData));
      return UserModel.fromJson(decodedData);
    } else {
      throw response.body;
    }
  }

  checkToken() async {
    if (box.hasData(kUserInfo)) {
      var user = box.read(kUserInfo);
      String id = user["_doc"]["_id"];
      var response = await http.get(Uri.parse("$kEndPoint/getUser/$id"));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        print(decodedData);
        return decodedData;
      } else {
        return false;
      }
    }
  }

  saveUser(UserModel user) {
    box.remove(kUserInfo);
    box.write(kUserInfo, user.toJson());
  }

  // @override
  // void onInit() {
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }
}
