import 'package:get/get.dart';

import 'package:m360_ict/app/modules/auth/controllers/sign_in_controller.dart';
import 'package:m360_ict/app/modules/auth/controllers/sign_up_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}
