import 'package:flutter/material.dart';
import 'package:freedom365_app/views/help.dart';
import 'package:freedom365_app/views/manavta.dart';
import 'package:freedom365_app/views/marg365.dart';
import 'package:freedom365_app/views/suvidha.dart';
import 'package:freedom365_app/views/Goa_happenings.dart';
import 'package:freedom365_app/views/goa_talent_bank.dart';
import 'package:freedom365_app/views/welcomescreen.dart';
import 'package:freedom365_app/widgets/login_controller.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  // Function to create a button with a square border and name
  Widget buildButton(BuildContext context, String text, String imagePath, Widget route,
      {double width = 155, double height = 155}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => route));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Button background color
              borderRadius: BorderRadius.circular(20), // Add rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 3, // Blur radius
                  offset: Offset(0, 5), // Offset to create the shadow
                ),
              ],
            ),
            child: ClipRRect( // Clip the image to make it round
              borderRadius: BorderRadius.circular(20), // Match the button's border radius
              child: Image.asset(
                imagePath,
                height: height, // Specify the image height
                width: width, // Specify the image width
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Function to sign out
  void signOut(BuildContext context) {
    // Implement your sign-out logic here
    // For example, if you are using Firebase Authentication, you can sign out like this:
    // FirebaseAuth.instance.signOut();
    // After signing out, you can navigate to the login page or perform any other desired actions.
    // For now, we'll just navigate to the login page.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 250, 249, 248),
            Color.fromARGB(255, 250, 249, 248),
            Color.fromARGB(255, 225, 170, 145),
            Color.fromARGB(255, 225, 116, 73),
            Color.fromARGB(255, 229, 98, 5),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set scaffold background color to transparent
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), // Adjust the height of the app bar
          child: AppBar(
            elevation: 0, // Remove elevation from the app bar
            backgroundColor: Color.fromARGB(255, 247, 73, 4), // Background color of the app bar (orange)
            title: Text(
              "SERVICES",
              style: TextStyle(
                color: Colors.white, // Text color of the title (white)
                fontSize: 20, // Adjust the font size
              ),
            ),
            centerTitle: true, // Center the title horizontally
            actions: [
              IconButton(
                icon: const Icon(Icons.help),
                color: Colors.white, // Color of the "?" icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpView(), // Replace 'HelpView()' with the actual help screen widget
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Obx(
            () {
              final account = controller.googleAccount.value;
              return ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(account?.displayName ?? 'Freedom'),
                    accountEmail: Text(account?.email ?? 'Freedom365@gmail.com', style: TextStyle(color: Colors.white)), // Change the text color to white
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          account?.photoUrl ?? 'assets/photos/download.jpeg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 73, 4), // Change the background color to red
                    ),
                  ),
                  ListTile(
                    title: Text('Sign Out'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      controller.logout(); // Call the signOut function when the "Sign Out" item is tapped
                       Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => WelcomeScreen()
                          )
                          );
                    },
                  ),
                ],
              );
            },
          ),
        ),
        body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 20), // Increase spacing above the logo
                Center(
                           child: Image.asset(
    'assets/photos/photo1.jpg', // Replace with the path to your logo image
    width: 200, // Adjust the width of the logo
    height: 550 * (130 / 1200), // Calculate the height to maintain the aspect ratio
    fit: BoxFit.cover,
  ),
),

                SizedBox(height: 40), // Increase spacing above the first row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, 'Goa Happenings', 'assets/photos/BUTTON1.png', GoaHappenings()),
                    SizedBox(width: 40), // Increase spacing between buttons
                    buildButton(context, 'Marg365', 'assets/photos/BUTTON2.png', Marg365()),
                  ],
                ),
                SizedBox(height: 40), // Increase spacing above the last row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, 'Manavta', 'assets/photos/BUTTON3.png', Manavta()),
                    SizedBox(width: 40), // Increase spacing between buttons
                    buildButton(context, 'Suvidha', 'assets/photos/BUTTON4.png', Suvidha()),
                  ],
                ),
                SizedBox(height: 40), // Increase spacing below the first row
                Align(
                  alignment: Alignment.center,
                  child: buildButton(context, 'Goa Talent Bank', 'assets/photos/BUTTONMID.png', Goa(), width: 355, height: 165),
                ),
                SizedBox(height: 100), // Increase spacing below the last row
              ],
            ),
            Positioned( // Position the sponsor image at the center bottom
              bottom: 0,
              left: (MediaQuery.of(context).size.width - 100) / 2, // Center horizontally
              child: Image.asset(
                'assets/photos/spons.png', // Replace with the path to your sponsor image
                width: 100, // Adjust the width of the sponsor image
                height: 100, // Adjust the height of the sponsor image
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
