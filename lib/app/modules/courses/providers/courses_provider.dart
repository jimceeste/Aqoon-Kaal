import 'dart:convert';
import 'dart:io';

import 'package:aqoon_bile/app/constants.dart';
import 'package:aqoon_bile/app/data/models/bundel_model.dart';
import 'package:aqoon_bile/app/data/models/course_model.dart';
import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class CoursesProvider extends GetConnect {
  final user = Get.find<UserController>();
  getBundles() async {
    var response =
        await http.get(Uri.parse("$kEndPoint/read-all-published-bundles"));
    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);
      return decodedData.map((e) => BundleModel.fromJson(e)).toList();
    } else {
      throw response.body;
    }
  }

  getBundleCourses({required String id}) async {
    //print(user.user.token);
    print(id);
    var response = await http.post(
      Uri.parse("$kEndPoint/read-bundle-courses"),
      body: {"_id": id},
      headers: {
        //HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${user.user.token!}'
      },
    );
    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);
      return decodedData.map((e) => CourseModel.fromJson(e)).toList();
    } else {
      throw response.body;
    }
  }

  buyCourse({required String bundleId, required String phone}) async {
    var response = await http.post(
        Uri.parse("$kEndPoint/course/enroll-mobile-paid-bundle/$bundleId"),
        body: {
          "phone": phone
        },
        headers: {
          //HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${user.user.token!}'
        });
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData['success']) throw response.body;
      print(decodedData);
      return decodedData;
    } else {
      throw response.body;
    }
  }

  cashOnDelivery(
      {required String phone,
      required String price,
      required String id,
      required String userId}) async {
    var response = await http.post(
        Uri.parse("$kEndPoint/course/enroll-cash-on-delivery-bundle/$id"),
        body: {
          "phone": phone,
          "price": price
        },
        headers: {
          //HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${user.user.token!}'
        });
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      print("THE DATA: $decodedData");
      return decodedData;
    } else {
      throw response.body;
    }
  }
}
