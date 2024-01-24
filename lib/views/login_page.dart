import 'package:flutter/material.dart';
import 'package:freedom365_app/widgets/login_controller.dart';
import 'package:get/get.dart';
import 'package:freedom365_app/views/homescreen.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  // Function to navigate to HomeScreen
  void navigateToHome(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
      );
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Login Page'),
      backgroundColor: Color.fromARGB(255, 240, 76, 11), // Set the background color to orange
    ),
    body: Center(
      child: Obx(() {
        if (controller.googleAccount.value == null)
          return buildLoginButton(context);
        else {
          // After successful login, navigate to HomeScreen
          navigateToHome(context);
          return const CircularProgressIndicator(); // Show a loading indicator while navigating
        }
      }),
    ),
  );
}

  FloatingActionButton buildLoginButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      icon: Image.asset(
        'assets/photos/google.png',
        height: 32,
        width: 32,
      ),
      label: Text("Sign in with Google"),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
