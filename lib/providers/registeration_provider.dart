import 'package:flutter/widgets.dart';
import 'package:shop_app_api/models/user_model.dart';
import 'package:shop_app_api/services/regestration_service.dart';

class RegisterProvider extends ChangeNotifier {
  UserData? userModel;

  Future<void> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {

    userModel = await RegisterService.registerService(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );

  }

  Future<void> logUser({
    required String email,
    required String password,
  }) async {

    userModel = await RegisterService.logService(
      email: email,
      password: password,
    );

  }
}
