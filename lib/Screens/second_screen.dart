import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome_screen.dart'; // Ensure you import the WelcomeScreen

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content of SecondScreen
          Center(
            child: Text('User profile page'),
          ),

          // Logout button positioned in the top-right corner
          Positioned(
            top: 40.0,
            right: 20.0, // Adjust as needed for padding from right
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

// After signing out, print the current user to the console.
                User? currentUser = FirebaseAuth.instance.currentUser;
                print(
                    "Current User: $currentUser"); // This should print null, as the user is logged out.

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
