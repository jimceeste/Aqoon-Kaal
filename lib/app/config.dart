import 'package:aqoon_bile/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';


class Config{
 static final user=Get.put<UserController>(UserController(),permanent: true);
  static callBack(Routing? setting){
    if(setting!=null){
      user.checkToken();
    }
  }
}