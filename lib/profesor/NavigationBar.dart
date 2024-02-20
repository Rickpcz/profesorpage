import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:profesorpage/profesor/activities.dart';
import 'package:profesorpage/profesor/class/classes.dart';
import 'package:profesorpage/profesor/notifications.dart';





class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final screens = [
  const NotificationClass(),
  ClassesTabContent(),
   const ActivityPage(),
   const NotificationClass(),
  ];
  final colors = [
    const Color(0xFF60A9CD),
    Colors.purple,
    Colors.green,
    Colors.red,
  ];

  // ignore: unused_field
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          screens[_currentIndex],
          
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: GNav(
          tabBackgroundColor: colors[0],
          selectedIndex: _currentIndex,
          tabBorderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
              _scaleFactor = 1.0;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.notifications,
              text: 'Actividades',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.groups_2,
              text: 'Clases',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.assignment,
              text: 'Tareas',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.chat,
              text: 'Chat',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            
          ],
        ),
      ),
    );
  }
}
