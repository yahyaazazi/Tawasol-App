import 'package:tawasol_app/base.dart';
import 'package:tawasol_app/models/my_user.dart';

abstract class LoginNavigator extends BaseNavigator {
  void goToHome(MyUser user);
}
