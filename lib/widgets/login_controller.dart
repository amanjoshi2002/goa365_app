import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  Future<void> login() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        googleAccount.value = account;
      }
    } catch (error) {
      print("Login failed: $error");
    }
  }

  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      googleAccount.value = null; // Set the value to null after signing out
    } catch (error) {
      print("Logout failed: $error");
    }
  }
}
