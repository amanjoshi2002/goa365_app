import 'package:flutter/material.dart';
import 'package:freedom365_app/views/homescreen.dart';
import 'package:video_player/video_player.dart';
import 'package:freedom365_app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freedom365_app/widgets/login_controller.dart';

class VideoPage extends StatefulWidget {
  final String videoPath;

  VideoPage({required this.videoPath});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  // Check whether the video has been shown before
  Future<bool> _hasVideoBeenShownBefore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('video_shown') ?? false;
  }

  // Mark the video as shown
  Future<void> _markVideoAsShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('video_shown', true);
  }

  // Initialize the video based on whether it has been shown before
  void _initializeVideo() async {
    final hasVideoBeenShown = await _hasVideoBeenShownBefore();

    if (!hasVideoBeenShown) {
      _controller = VideoPlayerController.asset(widget.videoPath)
        ..initialize().then((_) {
          setState(() {});
          _controller.play(); // Start playing the video
          _controller.addListener(() {
            if (_controller.value.isInitialized &&
                !_controller.value.isPlaying &&
                !_controller.value.isBuffering) {
              // Video playback has finished
              _markVideoAsShown();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            }
          });
        });
    } else {
      // Video has been shown before, directly navigate to the login page
      //if(controller.googleAccount.value == null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      }
      /*else{
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      }
    }*/
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Page"),
        backgroundColor: Color.fromARGB(255, 242, 62, 12), // Set the app bar color to orange
      ),
      body: Center(
        child: _controller?.value.isInitialized ?? false
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          // Skip functionality can be added here
          _markVideoAsShown(); // Mark the video as shown
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        icon: Icon(
          Icons.skip_next,
          size: 36.0,
        ),
      ),
    );
  }
}
