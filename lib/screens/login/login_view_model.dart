import 'package:tawasol_app/base.dart';
import 'package:tawasol_app/database_utils/database_utils.dart';
import 'package:tawasol_app/models/my_user.dart';
import 'package:tawasol_app/screens/login/login_navigator.dart';
import 'package:tawasol_app/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/components/firebase_errors.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var auth = FirebaseAuth.instance;
  String message = "";

  void login(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      MyUser? myUser = await DataBaseUtils.readUser(credential.user?.uid ?? "");
      message = "Successfully logged";
      if (myUser != null) {
        print("helllo");
        navigator!.hideDialog();
        navigator!.goToHome(myUser);
        return;
      }
    } on FirebaseAuthException catch (e) {
      message = "wrong email or password";
    } catch (e) {
      message = "Something went wrong";
    }
    if (message != "") {
      navigator!.hideDialog();
      navigator!.showMessage(message);
    }
  }
}
