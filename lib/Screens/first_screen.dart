import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0; // This will keep track of the active index

  Future<String> getCurrentUserEmail() async {
    final user = await FirebaseAuth.instance.currentUser;
    return user?.email ?? 'No user logged in';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('L.earn')),
      body: FutureBuilder<String>(
        future: getCurrentUserEmail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return CircularProgressIndicator();
          }

          final userEmail = snapshot.data;

          final List<Widget> _children = [
            Center(child: Text('Logged in as: $userEmail')),
            SecondScreen(),
          ];

          return _children[_currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'User Profile',
          ),
        ],
      ),
    );
  }
}
