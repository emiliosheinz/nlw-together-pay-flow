import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class HomeParams {
  final UserModel user;
  final AuthController authController;

  HomeParams({
    required this.user,
    required this.authController,
  });
}
