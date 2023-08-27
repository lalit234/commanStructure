import 'dart:async';

import 'package:dog_medical/utility/RouteInfo.dart';
import 'package:dog_medical/utility/sharedPref.dart';
import 'package:get/get.dart';

import '../../utility/Constants.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Timer(const Duration(seconds: 3),goNext);
    super.onInit();
  }

  goNext()
  {
    if(sharedPref.containKey(sharedPref.id))
    {
      Get.offAllNamed(RouteInfo.mainscreen);
    }else
    {
      Get.offAllNamed(RouteInfo.loginscreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}