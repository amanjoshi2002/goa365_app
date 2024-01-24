import 'package:flutter/material.dart';

import 'package:freedom365_app/widgets/custom_button.dart';
import 'package:freedom365_app/views/video_page.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/photos/photo1.jpg",
                    height: 300,
                  ),
                  const SizedBox(height: 25),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(
                            videoPath: 'assets/video/welcome.mp4',
                          ),
                        ),
                      );
                    },
                    text: "HOME",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
